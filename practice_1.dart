void main() {
  final String x = "hello World";
  final List<int> l = [1, 2, 5, 7, 3, 4, 6];
  final List<int> l2 = [0, 0, 1, 2, 5, 6, 4, 7, 3, 4, 6];

  print('reverse string: ' + reverseString(x));
  print('is palindrome: ' + isPalindrome('madam').toString());
  print('count charc: ' + countCharc(x).toString());
  print('capitalize first letter: ' + capFirstLetter(x).toString());
  print('remove vowels: ' + removeVowels(x).toString());
  print('is anagram: ' + isAnagram('silent', 'listen').toString());

  print('bubble sort: ' + bubbleSort(l).toString());
  print('remove duplicate: ' + removeDuplicate(l2).toString());
  print('largest number: ' + largestNumber(l).toString());
  print('smallest number: ' + smallestNumber(l).toString());
  print('move zeros to right: ' + moveZerosToRight(l2).toString());
  print('is array sorted: ' + isArraySorted(bubbleSort(l)).toString());
}

String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

bool isPalindrome(String input) {
  int left = 0;
  int right = input.length - 1;
  while (left < right) {
    if (input[left] != input[right]) return false;
    left++;
    right--;
  }
  return true;
}

Map<String, int> countCharc(String input) {
  Map<String, int> freq = {};
  for (var ch in input.split('')) {
    if (ch.trim().isEmpty) continue;
    freq[ch] = (freq[ch] ?? 0) + 1;
  }
  return freq;
}

String capFirstLetter(String input) =>
    input.split(' ').map((e) => e[0].toUpperCase() + e.substring(1)).join(' ');

String removeVowels(String input) {
  final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
  return input.split('').where((e) => !vowels.contains(e)).join();
}

bool isAnagram(String a, String b) {
  if (a.length != b.length) return false;
  Map<String, int> freq = {};

  for (var ch in a.split('')) {
    freq[ch] = freq[ch] ?? 0 + 1;
  }
  // remove if there in freq
  for (var ch in b.split('')) {
    if (!freq.containsKey(ch)) return false;
    freq[ch] = freq[ch] ?? 1 - 1;
    if (freq[ch] == 0) freq.remove(ch);
  }
  return freq.isEmpty;
}

List<int> bubbleSort(List<int> input) {
  assert(input.isNotEmpty, 'list cannot be empty');
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
  List<int> unique = [];
  for (int i = 0; i < input.length; i++) {
    bool isDuplicate = false;
    for (int j = 0; j < unique.length; j++) {
      if (input[i] == unique[j]) {
        isDuplicate = true;
      }
    }
    if (!isDuplicate) {
      unique.add(input[i]);
    }
  }
  return unique;
}

int largestNumber(List<int> input) {
  assert(input.isNotEmpty, 'list cannot be empty');
  int largestNum = input[0];
  for (int num in input) {
    if (num > largestNum) {
      largestNum = num;
    }
  }
  return largestNum;
}

int smallestNumber(List<int> input) {
  assert(input.isNotEmpty, 'list cannot be empty');
  int smallestNum = input[0];
  for (int num in input) {
    if (num < smallestNum) {
      smallestNum = num;
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

bool isArraySorted(List<int> input) {
  for (int i = 1; i > input.length; i++) {
    if (input[i] < input[i - 1]) {
      return false;
    }
  }
  return true;
}
