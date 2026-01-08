void main() {
  String x = "hello world";
  String a = "silent";
  String b = "listen";
  List<int> l = [3, 4, 6, 2, 3, 6, 4];
  List<int> l2 = [0, 0, 3, 2, 0, 5, 0, 3, 4, 0];

  // Strings
  print("/// STRING METHODS ///");
  print('reversed String: ' + reverseString(x));
  print('is palindrome: ' + isPalindrome(x).toString());
  print('count character: ' + countCharc(x).toString());
  print('capitalize first letter: ' + capFirstLetter(x).toString());
  print('remove vowels: ' + removeVowels(x).toString());
  print('is anagram: ' + isAnagram(a, b).toString());
  print('first non repeating: ' + firstNonRepeating(x).toString());
  print("-------------------------------\n");

  // Arrays & Lists
  print("/// ARRAY METHODS ///");
  print('bubble sorted: ' + bubbleSort(l).toString());
  print('removed duplicates: ' + removeDuplicate(l).toString());
  print('largest number: ' + largestNumber(l).toString());
  print('smallest number: ' + smallestNumber(l).toString());
  print('move zeros to right: ' + moveZerosToRight(l2).toString());
  print('move zeros to left: ' + moveZerosToLeft(l2).toString());
  print('is array sorted: ' + isArraySorted(l).toString());
  print("-------------------------------\n");

  // Arrays & Lists
  print("/// MATHS AND LOGICS ///");
  print('factorial: ${factorial(4)}');
  print('is prime: ${isPrime(5)}');
  print('swap 2 digits without using temp: ${swap(l)}');
  print("-------------------------------\n");
}

// Strings
String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

// palindrome -> string should be same in reverse, eg. 'madam'
bool isPalindrome(String input) {
  int left = 0;
  int right = input.length - 1;

  while (left < right) {
    if (input[left] != input[right]) return false;
    // else
    left++;
    right--;
  }
  // else
  return true;
}

Map<String, int> countCharc(String input) {
  final map = <String, int>{};
  for (var ch in input.split('')) {
    if (ch.trim().isEmpty) continue;
    map[ch] = (map[ch] ?? 0) + 1;
  }
  return map;
}

String capFirstLetter(String input) => input
    .split(' ')
    .map((c) => c.isEmpty ? c : c[0].toUpperCase() + c.substring(1))
    .join(' ');

String removeVowels(String input) {
  final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
  return input.split('').where((c) => !vowels.contains(c)).join();
}

bool isAnagram(String a, String b) {
  if (a.length != b.length) return false;

  final freq = <String, int>{};

  for (var ch in a.split('')) {
    freq[ch] = (freq[ch] ?? 0) + 1;
  }

  for (var ch in b.split('')) {
    if (!freq.containsKey(ch)) return false;
    freq[ch] = (freq[ch] ?? 1) - 1;
    if (freq[ch] == 0) freq.remove(ch);
  }
  return freq.isEmpty;
}

String? firstNonRepeating(String input) {
  final freq = {};

  for (var ch in input.split('')) {
    freq[ch] = (freq[ch] ?? 0) + 1;
  }

  for (var ch in input.split('')) {
    if (freq[ch] == 1) return ch;
  }

  // return freq.entries.firstWhere((e) => e.value == 1).key;

  // every char is repeating
  return null;
}

// Arrays & List
List<int> bubbleSort(List<int> input) {
  for (int i = 0; i < input.length - 1; i++) {
    for (int j = 0; j < input.length - i - 1; j++) {
      if (input[j] > input[j + 1]) {
        int temp = input[j];
        input[j] = input[j + 1];
        input[j + 1] = temp;
      }
    }
  }
  return input;
}

List<int> removeDuplicate(List<int> input) {
  //   input.toSet().toList();
  List<int> uniqueList = [];
  for (int i = 0; i < input.length; i++) {
    bool isDuplicate = false;
    for (int j = 0; j < uniqueList.length; j++) {
      if (input[i] == uniqueList[j]) {
        isDuplicate = true;
        break;
      }
    }
    if (!isDuplicate) {
      uniqueList.add(input[i]);
    }
  }
  return uniqueList;
}

int largestNumber(List<int> input) {
  assert(input.isNotEmpty);
  int largestNum = 0;
  for (int i = 0; i < input.length; i++) {
    if (input[i] > largestNum) {
      largestNum = input[i];
    }
  }
  return largestNum;
}

int smallestNumber(List<int> input) {
  assert(input.isNotEmpty);
  int smallestNum = input[0];
  for (int i = 0; i < input.length; i++) {
    if (input[i] < smallestNum) {
      smallestNum = input[i];
    }
  }
  return smallestNum;
}

List<int> moveZerosToRight(List<int> input) {
  int index = 0;
  for (int i = 0; i < input.length; i++) {
    if (input[i] != 0) {
      input[index++] = input[i];
    }
  }
  while (index < input.length) {
    input[index++] = 0;
  }
  return input;
}

List<int> moveZerosToLeft(List<int> input) {
  int index = input.length - 1; // go from behind
  for (int i = input.length - 1; i >= 0; i--) {
    if (input[i] != 0) {
      input[index--] = input[i];
    }
  }
  while (index >= 0) {
    input[index--] = 0;
  }
  return input;
}

bool isArraySorted(List<int> input) {
  for (int i = 1; i < input.length; i++) {
    if (input[i] < input[i - 1]) {
      return false;
    }
  }
  return true;
}

int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

bool isPrime(int n) {
  if (n <= 1) return false;

  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

// swap 2 numbers without using temp
List<int> swap(List<int> nums) {
  nums[0] = nums[0] + nums[1];
  nums[1] = nums[0] - nums[1];
  nums[0] = nums[0] - nums[1];
  return nums;
}
