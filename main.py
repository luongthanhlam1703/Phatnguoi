import schedule
import time
import subprocess

def run_robot_test():
    print("Chương trình đang tiến hành tra cưu vi phạm")
    openfile = "tracuu.robot"
    subprocess.run(["robot", openfile])

schedule.every().day.at("06:00").do(run_robot_test)
schedule.every().day.at("12:00").do(run_robot_test)

checktime = None

while True:
    schedule.run_pending()
    if checktime is None or time.time() - checktime >= 60:
        print("Chương trình đang chạy")
    checktime = time.time()

    time.sleep(1)
