namespace Quick_Quantum_Quest {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    @EntryPoint()
    operation GenerateRandomBit() : Result {
        // Allocate a qubit
        use q = Qubit();
        // put the qubit to superposition
        H(q);
        // it is now a 50% chance of being measured 0 or 1.
        // measure the qubit value.
        return M(q);
    }
}
