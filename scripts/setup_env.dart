import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    // print('Usage: dart scripts/setup_env.dart <env>');
    exit(1);
  }

  final env = args[0];
  if (!['dev', 'staging', 'prod'].contains(env)) {
    // print('Error: Environment must be one of: dev, staging, prod');
    exit(1);
  }

  try {
    // Read template file
    final templateFile = File('.env.template');
    if (!await templateFile.exists()) {
      // print('Error: .env.template file not found');
      exit(1);
    }

    final templateContent = await templateFile.readAsString();
    final envFile = File('.env.$env');

    // Check if file already exists
    if (await envFile.exists()) {
      // print('Warning: .env.$env file already exists');
      // print('Do you want to overwrite it? (y/N)');
      final response = stdin.readLineSync()?.toLowerCase();
      if (response != 'y') {
        // print('Setup cancelled');
        exit(0);
      }
    }

    // Create environment file
    await envFile.writeAsString(templateContent);
    // print('Created .env.$env file');
    // print(
    //     '\nPlease update the values in .env.$env with your environment-specific values');
    // print('Then run: dart scripts/encrypt_env.dart .env.$env');
  } catch (e) {
    // print('Error setting up environment: $e');
    exit(1);
  }
}
