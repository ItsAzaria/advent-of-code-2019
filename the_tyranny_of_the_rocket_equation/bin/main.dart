import 'dart:io';

int totalFuelRequirements = 0;
int totalFuelRequirementsPt2 = 0;

main() async {
  List<String> lines = await new File('bin/numbers.txt').readAsLines();
  List<int> modules = lines.map((line) => int.parse(line)).toList();

  modules.forEach((module){ 
    part1(module);
    part2(module);
  });

  print('Part 1: $totalFuelRequirements');
  print('Part 2: $totalFuelRequirementsPt2');
}

part1(int mass) {
  totalFuelRequirements += calcFuel(mass);
}

part2(int mass) {
  int fuel = calcFuel(mass);
  if (fuel <= 0) { return; }
  
  totalFuelRequirementsPt2 += fuel;
  part2(fuel);
}

int calcFuel(int mass) { return (mass / 3).floor() - 2; }