CXX = g++
CXXFLAGS = -Wall -Wextra
OFLAGS = -march=native -mtune=native -Ofast -ffast-math
LDFLAGS = -lpthread

BIN = phenom2_benchmark_arm

.PHONY: clean

$(BIN): main.cpp asm.o
	$(CXX) $(CXXFLAGS) $(OFLAGS) $^ -o $@ $(LDFLAGS)

asm.o: asm.s AND_REG_REG.s CMOVcc_REG_REG.s PADDB_MMX.s ADD_REG_1.s SHR_REG_CL.s AVXChecker.s FLOPS.s IMUL_REG_REG.s
	as -c asm.s -o asm.o

clean:
	@rm -rf *.o $(BIN)

