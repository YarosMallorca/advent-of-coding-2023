# Returns a list of the lines in the file
def get_file_contents():
    # load the input file into reading
    with open("input1.txt", "r") as txt_file:
        return txt_file.readlines()
    
if __name__ == "__main__":
    input_lines = get_file_contents()
    list_of_numbers = []
    spelled_out_numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    for line in input_lines:
        current_line_numbers = []
        processed_line = []
        for i in range(len(line)):
            match_found = False
            for idx, val in enumerate(spelled_out_numbers, 1):
                if line[i:].startswith(val):
                    processed_line.append("".join([str(idx)]))
                    match_found = True
                    break
            if not match_found:
                processed_line.append(line[i])

        filtered_line = ''.join(c for c in ''.join(processed_line) if c.isdigit())

        # If the n of numbers is 1, that means we have only 1 number, add it to itself.
        if len(filtered_line) < 2:
            current_line_numbers.append(filtered_line)
            current_line_numbers.append(filtered_line)

        # Else, we should add the first and last number in the list
        else:
            current_line_numbers.append(filtered_line[0])
            current_line_numbers.append(filtered_line[-1])

        # Join the numbers and add them to the list of numbers
        list_of_numbers.append(int("".join(current_line_numbers)))

    # Sum all the numbers
    print(sum(list_of_numbers)) 