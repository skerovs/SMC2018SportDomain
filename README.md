# SMC2018SportDomain
This is sports domain repository which is used for automated planning of training units

The experiments have been run with a planner called LPG. The planner is third-party software therefor it is not provided
in this repository, the planner can be downloaded for free on the official website of LPG at: http://zeus.ing.unibs.it/lpg/

___________________________________________________________________________________________________________


Once you will have the lpg planner downloaded at the location of this repository on your local machine, you can run the problem with the following command:
./lpg -o sport_domain.pddl -f ProblemFiles/entry_athlete_problem.pddl -out entry_athlete_problem.SOL -n 1 -restarts 70


<br>

_Sorting:_<br>
- the sorting script is called FormateSolution.sh
- to sort the solution run the sorting script with an argument of the solution location
- the result of the sorting script can be found in the location of the script in the file "SortedSolution.txt"

Example:
./FormateSolution.sh /entry_athlete_problem.SOL<br>


____________________________________________________________________________________________________________________