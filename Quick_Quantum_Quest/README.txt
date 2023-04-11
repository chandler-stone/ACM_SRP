This project was submitted as an attempt to get credit for the UAH ACM SRP.

The project currently generates a random number by declaring an array of qubits.
each qubit is set into an even superposition using the Hadamard operation.
The results are measured until one qubit has an entirely real result and all
others have a zero result. for each measurement, the state of the machine is dumped
to the terminal. after all the measureing is done, the state of  the machine is
dumped to the terminal and the index of the chosen qubit is the random number.