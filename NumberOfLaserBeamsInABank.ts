
//Problem 2125 
// Level : Medium
// You are given a 2D binary array bank where each element is either '0' (empty) or '1' (security device). A laser beam is formed between two devices in different rows if no devices exist in the rows between them.
//Return the total number of laser beams in the bank.



function numberOfBeams(bank: string[]): number {
    let prevRowDevices = 0;
    let totalBeams = 0;

    // Iterate over each row in the bank
    for (let row of bank) {
        // Count the number of '1's in the current row (security devices)
        let currentRowDevices = (row.match(/1/g) || []).length;

        // If the current row has devices and previous row also had devices
        if (currentRowDevices > 0) {
            // The number of laser beams between this row and the previous row
            totalBeams += prevRowDevices * currentRowDevices;
            // Update the previous row device count to the current row's device count
            prevRowDevices = currentRowDevices;
        }
    }

    return totalBeams;
}

// Example usage:
const bank = [
    "011001",
    "000000",
    "010100",
    "001000"
];

console.log(numberOfBeams(bank)); // Output will be the total number of laser beams
