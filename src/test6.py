# Author: Aniwat Ruttanaudom
def simple_cipher(text, k):
    result = ""
    for char in text:
        if char.isalpha():
            # Determine whether the character is uppercase or lowercase
            base = ord('A') if char.isupper() else ord('a')
            shifted_char = chr((ord(char) - base - k) % 26 + base)
            result += shifted_char
        else:
            # Non-alphabetic characters remain unchanged
            result += char
    return result

# Example usage
plaintext = "VTAOG"
k = 2
ciphertext = simple_cipher(plaintext, k)

print(f"Plaintext: {plaintext}")
print(f"Ciphertext: {ciphertext}")