import 'dart:io';
import 'dart:convert';

class ConfigManager {
  final String configFilePath = '.flutter_beautify_config.json';

  /// Initialize configuration by asking user for paths
  Future<void> init() async {
    print('\n🚀 Initializing Flutter Beautify Configuration...\n');

    // Get widget path
    final widgetPath = _getUserInput(
      'Enter widgets directory path (default: lib/widgets)',
      'lib/widgets',
    );

    // Get utils path
    final utilsPath = _getUserInput(
      'Enter utils directory path (default: lib/utils)',
      'lib/utils',
    );

    // Get demo path
    final demoPath = _getUserInput(
      'Enter demo directory path (default: lib/demo)',
      'lib/demo',
    );

    // Save configuration
    final config = {
      'widgetPath': widgetPath,
      'utilsPath': utilsPath,
      'demoPath': demoPath,
      'timestamp': DateTime.now().toIso8601String(),
    };

    await _saveConfig(config);

    print('\n✅ Configuration saved to $configFilePath');
    print('📁 Widgets path: $widgetPath');
    print('🛠️  Utils path: $utilsPath');
    print('📚 Demo path: $demoPath\n');
  }

  /// Get user input from command line
  String _getUserInput(String prompt, String defaultValue) {
    stdout.write('$prompt: ');
    final input = stdin.readLineSync()?.trim() ?? '';
    return input.isEmpty ? defaultValue : input;
  }

  /// Save configuration to file
  Future<void> _saveConfig(Map<String, dynamic> config) async {
    final file = File(configFilePath);
    await file.writeAsString(jsonEncode(config));
  }

  /// Load configuration from file
  Future<Map<String, dynamic>> loadConfig() async {
    final file = File(configFilePath);

    if (!await file.exists()) {
      return {
        'widgetPath': 'lib/widgets',
        'utilsPath': 'lib/utils',
        'demoPath': 'lib/demo',
      };
    }

    try {
      final content = await file.readAsString();
      return jsonDecode(content);
    } catch (e) {
      print('Warning: Could not load config file, using defaults');
      return {
        'widgetPath': 'lib/widgets',
        'utilsPath': 'lib/utils',
        'demoPath': 'lib/demo',
      };
    }
  }

  /// Show current configuration
  Future<void> showConfig() async {
    final config = await loadConfig();
    print('\n📋 Current Configuration:');
    print('📁 Widgets path: ${config['widgetPath']}');
    print('🛠️  Utils path: ${config['utilsPath']}');
    print('📚 Demo path: ${config['demoPath']}\n');
  }
}
