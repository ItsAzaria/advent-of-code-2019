import 'dart:io';

main() async {

  int totalFuelRequirements = 0;
  
  List<String> lines = await new File('bin/numbers.txt').readAsLines();
  List<int> modules = lines.map((line) => int.parse(line)).toList();

  modules.forEach((module){ 
    totalFuelRequirements += (module / 3).floor() - 2;
  });


  print(totalFuelRequirements);
}