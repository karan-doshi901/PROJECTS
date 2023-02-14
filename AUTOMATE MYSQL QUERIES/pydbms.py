import mysql.connector as d



con = d.connect(host="localhost", password="karan", user="root", database="karandoshi")  # connection object
cur = con.cursor()  # cursor object
if con.is_connected():
    r = int(input("TO START ENTER NUMBER GREATER THAN 0:  "))
    while r > 0:
        y = int(input("Enter 1 to DISPLAY , 2 CREATE , 3 INSERT "))
        if y == 1: #display
            flag=0
            cur.execute("show tables")
            tab = cur.fetchall()
            print("DISPLAYING TABLES ARE: ")
            num = 0
            for i in tab:
                num += 1
                print(num, " ", *i, end="\n")
            query = input("Enter TABLE NAME : ")
            while flag==0:
                sele="select * from "+query
                a = int(input("Enter 1.ALL RECORDS , 2.ONLY ONE RECORD, 3.SOME RECORDS (number will be taken )"))
                if a == 1:
                    cur.execute(sele)
                    print(cur.fetchall())
                elif a == 2:
                    cur.execute(sele)
                    print(cur.fetchone())
                elif a == 3:
                    b = int(input("NUMBER OF RECORDS TO BE DISPLAYED : "))
                    cur.execute(sele)
                    print(cur.fetchmany(b))
                flag=int(input("ENTER 0 TO CONTINUE"))
        elif y == 2:#create
            print("Let's create together")
            e = input("Enter T for table , D for database")
            if e == "T" or e == "t":
                t=input("table name: ")
                q = "create table if not exists "
                tab=q+t+"("
                no_of_attri=int(input("ENTER NUMBER OF ATTRIBUTE: "))
                print("1.INT, 2.VARCHAR(1000), 3.DATE, 4.TIME")
                for t in range(no_of_attri):
                    at=int(input("ENTER DATATYPE: "))
                    if at==1:
                        int1=input("ATTRIBUTE NAME: ")
                        a=int1+" int,"
                        tab=tab+a
                    elif at==2:
                        var=input("ATTRIBUTE NAME: ")
                        b=var+" varchar(1000),"
                        tab=tab+b
                    elif at==3:
                        date = input("ATTRIBUTE NAME: ")
                        c = date + " date,"
                        tab = tab + c
                    elif at==4:
                        time = input("ATTRIBUTE NAME: ")
                        d = time + " time,"
                        tab = tab + d

                tab1=tab.removesuffix(",")
                cur.execute(tab1+")")
                con.commit()
                print("\t\tTABLE CREATED...")
            elif e == "D" or e == "d":
                cre_dat="create database "

                q = input("DATABASE NAME: ")
                r=cre_dat+q
                cur.execute(r)
                print("Database successfully created...")
            else:
                print("INVALID INPUT")
        elif y == 3:  #INSERT
            print("You are in inserting Phase")
            cur.execute("show tables")
            tab = cur.fetchall()
            print("DISPLAYING TABLES ARE: ")
            num=0
            for i in tab:
                num+=1
                print(num," ",*i, end="\n")

            select_table = input("\nSELECT TABLE IN WHICH YOU WANT TO INSERT: ")
            cur.execute("desc" + " " + select_table)
            bran = cur.fetchall()
            y=0
            for j in bran:
                y+=1
                print(y," ",j[0], "\t", j[1], "\t", "\t", j[3])
            # taking values acc to datatypes
            l = []
            for data in range(len(bran)):
                type = int(input("enter 1 for int , 2 for str , 3 for any other"))
                if type == 1:
                    a1 = int(input())
                    l.append(a1)
                elif type == 2:
                    b1 = input()
                    l.append(b1)
                else:
                    c1 = input()
                    l.append(c1)
            inse = "insert into"
            val = "VALUES"
            vv = ",%s" * len(bran)
            vv1 = vv.removeprefix(",")
            s = inse + " " + select_table + " " + val + "(" + vv1 + ")"
            tup = tuple(l)
            cur.execute(s, tup)
            print("  [VALUE INSERTED]  ")
            con.commit()
            # taking multi values for insertion
            print("FOR MULTIPLE DATA INSERTION ENTER 'MULTI'")
            mul = input("HERE: ").lower()
            if mul == "multi":
                flag = 1
                while flag == 1:
                    l = []
                    for data in range(len(bran)):
                        type = int(input("enter 1 for int , 2 for str , 3 for any other"))
                        if type == 1:
                            a1 = int(input())
                            l.append(a1)
                        elif type == 2:
                            b1 = input()
                            l.append(b1)
                        else:
                            c1 = input()
                            l.append(c1)
                    inse = "insert into"
                    val = "VALUES"
                    vv = ",%s" * len(bran)
                    vv1 = vv.removeprefix(",")
                    s = inse + " " + select_table + " " + val + "(" + vv1 + ")"
                    tup = tuple(l)
                    cur.execute(s, tup)
                    print("  [VALUE INSERTED]  ")
                    con.commit()
                    tup = list(tup)
                    tup.clear()
                    flag = int(input("1.. or 0"))


        r = int(input("enter number greater than 0 to continue..."))
else:
    print("<<<NOT CONNECTED>>>")













