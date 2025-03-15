import 'dart:io';

Future<String> getFlutterVersion() async {
  // Specify the full path to the flutter executable
  final flutterPath = 'D:/Setup/Flutter/flutter_windows_3.19.5-stable/flutter/bin/flutter.bat'; // Ensure the path includes 'flutter.bat'

  final process = await Process.start(flutterPath, ['--version']);
  final output = await process.stdout.transform(SystemEncoding().decoder).join();
  final errorOutput = await process.stderr.transform(SystemEncoding().decoder).join();
  final exitCode = await process.exitCode;

  if (exitCode != 0) {
    throw Exception('Failed to get Flutter version: $errorOutput');
  }

  final versionLine = output.split('\n').firstWhere((line) => line.contains('Flutter'));
  final version = versionLine.split(' ')[1];
  return version;
}

Future<String> choosePackageVersion(String packageName, String flutterVersion) async {
  if (packageName == 'console_color') {
    // Example logic for choosing a version based on Flutter version
    if (flutterVersion.startsWith('2.')) {
      return '1.0.0';
    } else if (flutterVersion.startsWith('3.')) {
      return '2.0.0';
    }
  }
  // Default to a valid version constraint
  return '^1.0.0';
}

void main() async {
  try {
    final flutterVersion = await getFlutterVersion();
    print('Current Flutter version: $flutterVersion');

    final packageFile = File('./packages.txt'); // Updated to look in the current directory
    if (!packageFile.existsSync()) {
      print('packages.txt not found.');
      return;
    }

    final packageContent = await packageFile.readAsString();
    final packageLines = packageContent.split('\n').where((line) => line.trim().isNotEmpty);

    for (var line in packageLines) {
      final packageName = line.trim();
      final packageVersion = await choosePackageVersion(packageName, flutterVersion);
      print('Chosen version for $packageName: $packageVersion');
    }
  } catch (e) {
    print('Error: $e');
  }
}