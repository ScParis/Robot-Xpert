import psycopg2


class DeloreanLibrary():

    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
#        info(query)

        conn = psycopg2.connect(
            host='ec2-52-71-161-140.compute-1.amazonaws.com',
            database='d74ag57qlkkv2s',
            user='xupsryzomrzxpe',
            password='caf3179b3d24f9a43a3ec305afcb2e3fbb30adb934fe63adf843be5865a62e1b',

        )

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_student(self, student):

        query = ("insert into students  (name, email, age, weight, feet_tall,created_at,updated_at)"
                 "values('{}','{}',{},{},{},now(),now());".format(
                     student['name'], student['email'], student['age'], student['weight'], student['feet_tall'])
                 )
#        info(query)

        conn = psycopg2.connect(
            host='ec2-52-71-161-140.compute-1.amazonaws.com',
            database='d74ag57qlkkv2s',
            user='xupsryzomrzxpe',
            password='caf3179b3d24f9a43a3ec305afcb2e3fbb30adb934fe63adf843be5865a62e1b',

        )

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()
