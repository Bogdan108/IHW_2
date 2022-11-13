.PHONY: testASM


ReadWriteFile: main_with_parts/complete
	./main_with_parts/complete file InOutputFiles/input.txt  InOutputFiles/output.txt
	./main_with_parts/complete file InOutputFiles/input_sec.txt  InOutputFiles/output_sec.txt

testC: main
	./test.sh main Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main Tests/Test8.txt Tests/Test8_output.txt

testCfile: main_with_parts/complete
	./test.sh main_with_parts/complete Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main_with_parts/complete Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main_with_parts/complete Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main_with_parts/complete Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main_with_parts/complete Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main_with_parts/complete Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_with_parts/complete Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main_with_parts/complete Tests/Test8.txt Tests/Test8_output.txt

testAsm: main_without_optimize/main_without_Optimize
	./test.sh main_without_optimize/main_without_Optimize Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main_without_optimize/main_without_Optimize Tests/Test8.txt Tests/Test8_output.txt

testAsmReg: main_with_registers/main_with_Registers
	./test.sh main_with_registers/main_with_Registers Tests/Test1.txt Tests/Test1_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test2.txt Tests/Test2_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test3.txt Tests/Test3_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test4.txt Tests/Test4_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test5.txt Tests/Test5_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test6.txt Tests/Test6_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test7.txt Tests/Test7_output.txt
	./test.sh main_with_registers/main_with_Registers Tests/Test8.txt Tests/Test8_output.txt

specialDatatime: main main_with_registers/main_with_Registers main_with_parts/complete
	./main time random 600
	./main time random 500
	./main time random 450
	./main_with_registers/main_with_Registers time random 600
	./main_with_registers/main_with_Registers time random 500
	./main_with_registers/main_with_Registers time random 450
	./main_with_parts/complete time random 600
	./main_with_parts/complete time random 500
	./main_with_parts/complete time random 450