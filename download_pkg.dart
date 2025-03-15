import 'dart:io';

import 'package:console_bars/console_bars.dart';

import 'check_flutter_version.dart';

Future<void> installPackage(String packageName, String version) async {
  // Specify the full path to the flutter executable
  final flutterPath = 'D:/Setup/Flutter/flutter_windows_3.19.5-stable/flutter/bin/flutter.bat'; // Ensure the path includes 'flutter.bat'

  final result = await Process.run(flutterPath, ['pub', 'add', '$packageName:$version']);
  if (result.exitCode != 0) {
    throw Exception('Failed to install $packageName@$version: ${result.stderr}');
  }
  print(result.stdout);
}

void main() async {
  final packageFile = File('./packages.txt'); // Updated to look in the current directory

  if (!packageFile.existsSync()) {
    print('packages.txt not found.');
    return;
  }

  final pubspecFile = File('./pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    print('pubspec.yaml not found.');
    return;
  }

  final pubspecContent = await pubspecFile.readAsString();
  final flutterVersion = await getFlutterVersion();

  final packageContent = await packageFile.readAsString();
  final packageLines = packageContent.split('\n').where((line) => line.trim().isNotEmpty);

  for (var line in packageLines) {
    final packageName = line.trim();

    if (pubspecContent.contains('$packageName:')) {
      print('$packageName is already added.');
      continue;
    }

    final packageVersion = await choosePackageVersion(packageName, flutterVersion);
    print('Installing $packageName@$packageVersion...');
    
    final bar = FillingBar(
      desc: 'Installing $packageName',
      total: 100,
      percentage: true,
    );

    for (var i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 20));
      bar.increment();
    }

    // Simulate package installation
    try {
      await installPackage(packageName, packageVersion);
      print('$packageName installed successfully.');
    } catch (e) {
      print('Error installing $packageName: $e');
    }
  }

  // Append new dependencies to pubspec.yaml
  final newDependencies = packageLines.map((line) => '  $line').join('\n');
  final updatedPubspec = pubspecContent.replaceFirst(RegExp(r'dependencies:\n'), 'dependencies:\n$newDependencies\n');

  await pubspecFile.writeAsString(updatedPubspec);
  print('pubspec.yaml updated successfully.');

  print('All packages installed.');
}
