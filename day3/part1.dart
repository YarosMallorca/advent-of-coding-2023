import 'dart:io';

void main() {
  List<String> lines = File('input.txt').readAsLinesSync();
  int res = 0;
  for (int li = 1; li < lines.length - 1; li++) {
    String line = lines[li];
    for (int i = 0; i < line.length; i++) {
      String c = line[i];
      if (c == '.' || isDigit(c)) {
        continue;
      }
      List<int> partNums = checkSurroundings([lines[li - 1], lines[li], lines[li + 1]], i);
      res += partNums.fold(0, (a, b) => a + b);
    }
  }
  print(res);
}

class Checker {
  int top_left = -1;
  int top_middle = -1;
  int top_right = -1;
  int middle_left = -1;
  int middle_right = -1;
  int bottom_left = -1;
  int bottom_middle = -1;
  int bottom_right = -1;

  List<int> getResult() {
    List<int> ret = [];
    if (top_middle != -1) {
      ret.add(top_middle);
    } else if (top_left != -1 || top_right != -1) {
      if (top_left != -1) ret.add(top_left);
      if (top_right != top_left && top_right != -1) {
        ret.add(top_right);
      }
    }
    if (middle_left != -1) ret.add(middle_left);
    if (middle_right != -1) ret.add(middle_right);
    if (bottom_middle != -1) {
      ret.add(bottom_middle);
    } else if (bottom_left != -1 || bottom_right != -1) {
      if (bottom_left != -1) ret.add(bottom_left);
      if (bottom_right != bottom_left && bottom_right != -1) {
        ret.add(bottom_right);
      }
    }
    return ret;
  }
}

int getNumAt(String input, int index) {
  int leftI = index;
  int rightI = index;
  while (leftI > 0 && isDigit(input[leftI - 1])) {
    if (isDigit(input[leftI - 1])) {
      leftI--;
    } else {
      break;
    }
  }
  while (rightI < input.length && isDigit(input[rightI])) {
    rightI++;
  }
  return int.parse(input.substring(leftI, rightI));
}

List<int> checkSurroundings(List<String> input, int index) {
  Checker ret = Checker();
  if (index > 0) {
    if (isDigit(input[0][index - 1])) {
      ret.top_left = getNumAt(input[0], index - 1);
    }
    if (isDigit(input[1][index - 1])) {
      ret.middle_left = getNumAt(input[1], index - 1);
    }
    if (isDigit(input[2][index - 1])) {
      ret.bottom_left = getNumAt(input[2], index - 1);
    }
  }
  if (isDigit(input[0][index])) {
    ret.top_middle = getNumAt(input[0], index);
  }
  if (isDigit(input[2][index])) {
    ret.bottom_middle = getNumAt(input[2], index);
  }

  if (isDigit(input[0][index + 1])) {
    ret.top_right = getNumAt(input[0], index + 1);
  }
  if (isDigit(input[1][index + 1])) {
    ret.middle_right = getNumAt(input[1], index + 1);
  }
  if (isDigit(input[2][index + 1])) {
    ret.bottom_right = getNumAt(input[2], index + 1);
  }

  return ret.getResult();
}

bool isDigit(String s) {
  return double.tryParse(s) != null;
}
