import 'dart:io';

List<int> valueStore;

main() async {
  String list = await new File('bin/input.txt').readAsString();
  valueStore = list.split(',').map((value) => int.parse(value)).toList();

  print('Part 1: ${await part1(12, 2)}');
  print('Part 2: ${await part2()}');
}

part1(noun, verb) async {
  List<int> values = []..addAll(valueStore);
  // Reset state
  values[1] = noun;
  values[2] = verb;

  for(int i = 0; i < values.length; i+= 4) {
    if (values[i] == 99) { break; }
    if (values[i+1] >= values.length || values[i+2] >= values.length) { break; }

    int pos1 = values[values[i+1]];
    int pos2 = values[values[i+2]];

    if (values[i] == 1) { values[values[i+3]] = pos1 + pos2; }
    else if (values[i] == 2) { values[values[i+3]] = pos1 * pos2; }
    else { print('Error, invalid opcode ${values[i]}'); }

  }

  return values[0];
}

part2() async {
  for(int i = 0; i <= 99; i++) {
    for(int j = 0; j <= 99; j++) {
      int value = await part1(i, j);

      if (value == 19690720) {
        return i.toString() + j.toString();
      }
    }
  }
}