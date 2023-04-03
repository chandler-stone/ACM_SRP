namespace Quick_Quantum_Quest {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GenerateRandomBit() : Result {
        // Allocate a qubit
        use q = Qubit();
        // put the qubit to superposition
        H(q);
        // it is now a 50% chance of being measured 0 or 1.
        // measure the qubit value.
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

    @EntryPoint()
    operation SampleRandumNumber() : Int {
        let max = 50;
        let min = 10;
        Message($"Sampling a random number between {min} and {max}: ");
        return SampleRandomNumberInRange(min, max);
    }
}