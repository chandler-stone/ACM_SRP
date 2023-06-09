namespace Quick_Quantum_Quest {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Arrays;
    
    operation GenerateRandomBit() : Result {
        // Allocate a qubit
        use q = Qubit();
        Message("Initialized qubit:");
        DumpMachine();
        Message(" ");
        // put the qubit to superposition
        H(q);
        Message("Qubit after applying H:");
        DumpMachine();
        Message(" ");
        // it is now a 50% chance of being measured 0 or 1.
        // measure the qubit value.
        let randomBit = M(q);
        Message("Qubit after the measurement");
        DumpMachine();
        Message(" ");
        Reset(q);
        Message("Qubit after resetting:");
        DumpMachine();
        Message(" ");
        return randomBit;
    }

    @EntryPoint()
    operation GenerateRandomNumber() : Int {
        use Qubits = Qubit[3];
        ApplyToEach(H, Qubits);
        Message("The qubit register in a uniform superposition: ");
        DumpMachine();
        mutable results = [];
        for q in Qubits {
            Message(" ");
            set results += [M(q)];
            DumpMachine();
        }
        Message(" ");
        Message("Your random number is: ");
        DumpMachine();
        return BoolArrayAsInt(ResultArrayAsBoolArray(results));
    }

    operation GenererateSpecificState(alpha : Double) : Result {
        use q = Qubit();
        Ry(2.0 * ArcCos(Sqrt(alpha)), q);
        Message("The Qubit is in the desired space");
        Message("");
        DumpMachine();
        Message("");
        Message("Your skewed random bit is:");
        return M(q);
    }

    operation SampleRandomNumberInRange(min : Int, max : Int) : Int {
        mutable output = 0;
        repeat {
            mutable bits = [];
            for idxBit in 1..BitSizeI(max) {
                set bits += [GenerateRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max and output >= 10);
        return output;
    }

    operation SampleRandumNumber() : Int {
        let max = 50;
        let min = 10;
        Message($"Sampling a random number between {min} and {max}: ");
        return SampleRandomNumberInRange(min, max);
    }
}