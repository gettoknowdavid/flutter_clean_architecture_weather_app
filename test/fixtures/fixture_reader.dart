import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

final expectedMap = {
  'coord': {'lon': 1.1, 'lat': 1.1},
  'weather': [
    {
      'id': 1,
      'main': 'Test main',
      'description': 'Test description',
      'icon': 'Test icon'
    }
  ],
  'base': 'Test base',
  'main': {
    'temp': 1.1,
    'feels_like': 1.1,
    'temp_min': 1.1,
    'temp_max': 1.1,
    'pressure': 1,
    'humidity': 1,
    'sea_level': 1,
    'grnd_level': 1
  },
  'visibility': 1,
  'wind': {'speed': 1.1, 'deg': 1},
  'clouds': {'all': 1},
  'dt': 1,
  'sys': {'country': 'Test country', 'sunrise': 1, 'sunset': 1},
  'timezone': 1,
  'id': 1,
  'name': 'Test name',
  'cod': 1
};
