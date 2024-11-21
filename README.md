# FaultLocSim

## Description
This project releases the FL(Fault Localization) dataset of simulation tools(Iverilog and Verilator) for future studies.

## Dependencies
+ Python library dependencies

	pandas 2.0.3

	python 3.8.18


+ Project dependencies

	You can access the project link to download the corresponding dependencies.

	https://github.com/steveicarus/iverilog

	https://github.com/verilator/verilator


+ Other dependencies

	GCC 4.8.5

	Lcov 1.16

## Usage
**If you want to use our dataset quickly, the following is a quick tutorial. (Using Verilator as an example).**

1. Download the Verilator source code into the 'FaultLocSim/project/' folder, ensuring that the necessary dependencies have been downloaded.
```
cd FaultLocSim
mkdir project
git clone https://github.com/verilator/verilator.git
```
2. Change directory to the 'FaultLocSim/code/verilator' directory and execute `python main.py bugID`. `bugID` is a integer means the bug id. Use `1` in this example.
```
cd FaultLocSim/code/verilator
python main.py 1
```
3. Coverage information is stored in the 'FaultLocSim/coverage' directory, while the test cases that trigger bugs are saved in the 'FaultLocSim/testcase' folder."

---

**more clearly description**

+ code

	Contains the generation  code of the fault dataset of Iverilog and Verilator. 
	`main.py` is the main program. Using `python main.py bugID` at command line, `bugID` is an integer and means the bug id. You can open the Repository.csv file to check the bug ids of each project.
	`runcmd.py` is the tool script, which used to call command line commands and return results.
	
+ testcase

	Contains the test cases for both Iverilog and Verilator. Each bug version has its own folder. Please note that while this project contains only Iverilog test cases, the Verilator test cases will be generated and stored in "testcase/verilator" during runtime.

+ project

	The project source code directory should have the source code for Iverilog or Verilator downloaded into the "project" directory before running code/*/main.py. Additionally, ensure that the environment has all the necessary dependencies to run the project.

+ coverage

	The folder contains the coverage information files. It will be created after running any bug version, with each bug ID corresponding to a 'coverage_bug_`bugID`.info' file.

+ IverilogRepository.csv

	The fault dataset information of Iverilog. The following is a description of each field.

| Field | Description | 
| ------ | ------ |
| id | the bug id |
| branch | git project branch |
| fix version | the fixed version of this bug in git project |
| bug version | the bug version of this bug in git project |
| bug file | the root fault file corresponding to this bug |
| method | the root fault method corresponding to this bug |
| line | the root fault statements corresponding to this bug |
| command | command to run the test case that triggered the bug |
| type | `1` for feature-dependent bug; `0` for feature-independent bug |
| issue link | the issue address of the original project |

+ VerilatorRepository

	The fault dataset information of Verilator. Similarly to the Iverilog.

Spectrum-based Fault localization method used in experiments: 
![image](https://github.com/FaultLocSim/FaultLocSim/blob/main/spectrum%20formule.png)
Refer to the paper for detailed definitions: An evaluation of pure spectrum-based fault localization techniques for large-scale software systems
