import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

// Process.runSync가 경로 잡는데에 문제가 있어 test run을 실행해야함
void main() {

  final config = File('apps.yaml').readAsStringSync();
  final yaml = loadYaml(config);
  final currentApp = yaml['current_app'];
  print('currentApp: $currentApp');

  // 프로젝트 절대 경로 앞 부분
  const rootDir = '/Users/suhyeon/Documents/GitHub/Flutter_APPs';

  // 앱 경로 설정
  final appPath = join(rootDir, 'apps', currentApp, 'lib', 'main.dart');
  print('appPath: $appPath');

  // 경로가 존재하는지 확인
  if (!File(appPath).existsSync()) {
    print("⚠️ 앱 경로가 존재하지 않습니다: $appPath");
    return;
  }

  // 외부 프로세스 실행 (flutter run)
  final result = Process.runSync('flutter', ['run', '-t', appPath]);

}
