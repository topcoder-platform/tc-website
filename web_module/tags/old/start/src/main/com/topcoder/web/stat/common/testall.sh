rm -f BeanTest.out
echo "Testing command 1" > BeanTest.out
java BeanTest c=1 rd=4014 "Round Statistics Data" >> BeanTest.out
java BeanTest c=1 rd=4014 "Rounds By Date" >> BeanTest.out
java BeanTest c=1 rd=4014 "Rooms For Round" >> BeanTest.out
echo "Testing command 2" >> BeanTest.out
java BeanTest c=2 rd=4014 rm=2730 cr=152073 "Room Summary Data" >> BeanTest.out
java BeanTest c=2 rd=4014 rm=2730 cr=152073 "Coder Result Summary" >> BeanTest.out
java BeanTest c=2 rd=4014 rm=2730 cr=152073 "Coder Problems" >> BeanTest.out
java BeanTest c=2 rd=4014 rm=2730 cr=152073 "Coder Challenges" >> BeanTest.out
java BeanTest c=2 rd=4014 rm=2730 cr=152073 "Coder Defenses" >> BeanTest.out
java BeanTest c=2 rd=4014 rm=2730 cr=152073 "Rooms For Round" >> BeanTest.out
echo "Testing command 3" >> BeanTest.out
java BeanTest c=3 rd=4014 pm=235 cr=152073 "Problem Data" >> BeanTest.out
java BeanTest c=3 rd=4014 pm=235 cr=152073 "Problem Defenses" >> BeanTest.out
java BeanTest c=3 rd=4014 pm=235 cr=152073 "System Tests" >> BeanTest.out
echo "Testing command 4" >> BeanTest.out
java BeanTest c=4 rd=4014 pm=235 "Problem Statement" >> BeanTest.out
echo "Testing command 5" >> BeanTest.out
java BeanTest c=5 rd=4014 pm=235 cr=152073 "Problem Submission" >> BeanTest.out
echo "Testing command 6" >> BeanTest.out
java BeanTest c=6 cr=152073 "Coder Data" >> BeanTest.out
java BeanTest c=6 cr=152073 "Coder Submission Summary" >> BeanTest.out
echo "Testing command 7" >> BeanTest.out
java BeanTest c=7 "Winning Debuts" >> BeanTest.out
echo "Testing command 8" >> BeanTest.out
java BeanTest c=8 "All Time Wins" >> BeanTest.out
echo "Testing command 9" >> BeanTest.out
java BeanTest c=9 "Highest Totals" >> BeanTest.out
echo "Testing command 10" >> BeanTest.out
java BeanTest c=10 "Highest Rating Gains" >> BeanTest.out
echo "Testing command 11" >> BeanTest.out
java BeanTest c=11 "Highest Submission Accuracy" >> BeanTest.out
echo "Testing command 12" >> BeanTest.out
java BeanTest c=12 "Impressive Debuts" >> BeanTest.out
echo "Testing command 13" >> BeanTest.out
java BeanTest c=13 "Most Consecutive Wins" >> BeanTest.out
echo "Testing command 14" >> BeanTest.out
java BeanTest c=14 "Highest Challenge Success" >> BeanTest.out
echo "Testing command 15" >> BeanTest.out
java BeanTest c=15 cr=152073 "Earnings History" >> BeanTest.out
echo "Testing command 16" >> BeanTest.out
java BeanTest c=16 cr=152073 "Ratings History" >> BeanTest.out

