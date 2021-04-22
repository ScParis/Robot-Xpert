import psycopg2


class DeloreanLibrary():

    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)

        conn = psycopg2.connect(
            host='ec2-52-71-161-140.compute-1.amazonaws.com',
            database='d74ag57qlkkv2s',
            user='xupsryzomrzxpe',
            password='caf3179b3d24f9a43a3ec305afcb2e3fbb30adb934fe63adf843be5865a62e1b'
        )

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()
