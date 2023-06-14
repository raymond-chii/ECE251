#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <bitset>

using namespace std;

// Define opcodes for MIPS instructions
map<string, string> opcodes;

void initialize_opcodes() {
    opcodes.insert(pair<string, string>("add", "0001"));
    opcodes.insert(pair<string, string>("sub", "0010"));
    opcodes.insert(pair<string, string>("and", "0011"));
    opcodes.insert(pair<string, string>("or", "0100"));
    opcodes.insert(pair<string, string>("slt", "0101"));
    opcodes.insert(pair<string, string>("lw", "0110"));
    opcodes.insert(pair<string, string>("sw", "0111"));
    opcodes.insert(pair<string, string>("beq", "1000"));
    opcodes.insert(pair<string, string>("addi", "1001"));
    opcodes.insert(pair<string, string>("jump", "1010"));
}

int main() {
    // Initialize opcodes
    initialize_opcodes();

    // Open input and output files
    ifstream input_file("input.txt");
    ofstream output_file("output.txt");

    // Process each line of input file
    string line;
    while (getline(input_file, line)) {
        // Split line into instruction and operands
        size_t pos1 = line.find('$');
        size_t pos2 = line.find(',', pos1);
        string rd = line.substr(pos1+1, pos2-pos1-1);
        size_t pos3 = line.find('$', pos2);
        size_t pos4 = line.find(',', pos3);
        string rs = line.substr(pos3+1, pos4-pos3-1);
        string immediate = line.substr(pos4+2);

        // Get opcode for instruction
        string opcode_hex = opcodes["addi"];

        // Convert operands to binary and pad with zeros
        string binary_operands = "";
        binary_operands += bitset<5>(stoi(rs.substr(1))).to_string();
        binary_operands += bitset<5>(stoi(rd.substr(1))).to_string();
        binary_operands += bitset<16>(stoi(immediate)).to_string();

        // Combine opcode and binary operands to form 8-bit hex instruction
        string binary_instruction = opcode_hex + binary_operands;
        int decimal_instruction = stoi(binary_instruction, nullptr, 2);
        string hex_instruction = to_string(decimal_instruction);
        while (hex_instruction.length() < 2) {
            hex_instruction = "0" + hex_instruction;
        }

        // Write hex instruction to output file
        output_file << hex_instruction << endl;
    }

    // Close input and output files
    input_file.close();
    output_file.close();

    return 0;
}
