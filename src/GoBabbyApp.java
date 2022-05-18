//import com.ibm.db2.jcc.DB2Driver;
import javax.swing.plaf.nimbus.State;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class GoBabbyApp {

    public static void main(String[] args) throws SQLException{
        System.out.println("running");
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";
        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = null;
        String your_password = null;
        try {
            File login = new File("login.txt");
            Scanner sc = new Scanner(login);
            while (sc.hasNext()) {
                your_userid = sc.nextLine();
                your_password = sc.nextLine();
            }
            sc.close();
        }
        catch (FileNotFoundException e){
            e.printStackTrace();
        }
        //System.out.println(your_userid + your_password);
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;
        outer:while (true) {
            System.out.println("Please enter your practitioner id [E] to exit");
            Scanner sc = new Scanner(System.in);
            String practitionerid = sc.nextLine();
            if(practitionerid.equals("E")){
                System.out.println("Exiting application");
                statement.close();
                con.close();
                break;
            }
            String mid = "select practitionerid from midwife where practitionerid=\'" + practitionerid + "\'";
            ResultSet rspid = statement.executeQuery(mid);

            if (rspid.next()){
                System.out.println("practionerid exists in database");

                while(true){
                    System.out.println("Please enter the date [MM/DD/YYYY] for appointment list [E] to exit: ");
                    String date = sc.nextLine(); // date the midwife input
                    if(date.equals("E")){
                        System.out.println("Exiting application");
                        statement.close();
                        con.close();
                        break outer;
                    }
                    // list all apointments for date, ordered by time, P/B to denote primary or backup midwife
                    // num: time p/b mname hcardid
                    String adate = "select APPOINTMENT.AID, APPOINTMENT.ATIME,MOTHER.MNAME, MOTHER.HCARDID,PREGNANCY.PREGNANCYID,PREGNANCY.BACKUPID from " +
                            "PREGNANCY inner join APPOINTMENT on pregnancy.pregnancyid=appointment.pregnancyid " +
                            "inner join PARENTS on parents.coupleid=pregnancy.coupleid " +
                            "inner join MOTHER on mother.hcardid=parents.hcardid " +
                            "inner join MIDWIFE M on M.PRACTITIONERID = APPOINTMENT.PRACTITIONERID " +
                            "where (APPOINTMENT.PRACTITIONERID=\'" + practitionerid + '\'' + "or PREGNANCY.BACKUPID=\'" + practitionerid +"\'" + ") and ADATE=\'" + date + '\'';
                    //System.out.println(adate);
                    ResultSet rsadate = statement.executeQuery(adate);
                    if(!rsadate.next()){
                        System.out.println("There are no appointments scheduled for this date");
                    }
                    else{
                        //int count = 1;
                        //String aid = rsadate.getString("aid");
                        String currpid = rsadate.getString("pregnancyid");
                        //String currdate = rsadate.getString("adate");
//                        while (rsadate.next()){
//                            System.out.println(rsadate.getString("aid") + ':' + '\t' + rsadate.getString("atime") + '\t' + rsadate.getString("mname") + '\t' + rsadate.getString("hcardid"));
//                        }
                        List<String> appts = new ArrayList<>();
                        String appt;
                        do{
                            //System.out.println(rsadate.getString("backupid"));
                            //System.out.println(rsadate.getString("pregnancyid"));

                            if(rsadate.getString("backupid")!=null && rsadate.getString("backupid")== practitionerid){ //backup
                                appt = rsadate.getString("aid") + ':' + '\t' + "B " + rsadate.getString("atime")
                                        + '\t' + rsadate.getString("mname") + '\t' + rsadate.getString("hcardid");
                            }
                            else{
                                appt = rsadate.getString("aid") + ':' + '\t' + "P " + rsadate.getString("atime")
                                        + '\t' + rsadate.getString("mname") + '\t' + rsadate.getString("hcardid");
                            }
                            //String appt = rsadate.getString("aid") + ':' + '\t' + rsadate.getString("atime")
                            //        + '\t' + rsadate.getString("mname") + '\t' + rsadate.getString("hcardid");
                            //System.out.println(rsadate.getString("aid") + ':' + '\t' + rsadate.getString("atime") + '\t' + rsadate.getString("mname") + '\t' + rsadate.getString("hcardid"));
                            System.out.println(appt);
                            appts.add(appt);
                            //count++;
                        }while (rsadate.next());

                        while(true) {
                            System.out.println("Enter the appointment number that you would like to work on: ");
                            System.out.println("\t [E] to exit [D] to go back to another date: ");
                            String apptopt = sc.nextLine();
                            System.out.println(apptopt);
                            if(apptopt.equals("D")){
                                System.out.println("Back to another date");
                                break;
                            }
                            else if(apptopt.equals("E")){
                                System.out.println("Exiting application");
                                statement.close();
                                con.close();
                                break outer;
                            }
                            else {
                                //Integer aid = Integer.valueOf(apptopt); // identify appointments by aid
                                //currpid = apptopt;
                                while (true) {
                                    // for mothername motherhcardid
                                    //System.out.println(apptopt);
                                    String printstmt = "select MOTHER.MNAME, MOTHER.HCARDID,PREGNANCY.PREGNANCYID from PREGNANCY " +
                                            "inner join APPOINTMENT on pregnancy.pregnancyid=appointment.pregnancyid " +
                                            "inner join PARENTS on parents.coupleid=pregnancy.coupleid " +
                                            "inner join MOTHER on mother.hcardid=parents.hcardid " +
                                            "inner join MIDWIFE M on M.PRACTITIONERID = APPOINTMENT.PRACTITIONERID " +
                                            "inner join NOTES N on APPOINTMENT.AID = N.AID " +
                                            "where APPOINTMENT.AID=" + apptopt;// + String.valueOf(aid);
                                    //System.out.println(printstmt);
                                    ResultSet rstmt = statement.executeQuery(printstmt);
                                    if (rstmt.next()) {
                                        currpid = rstmt.getString("pregnancyid");
                                        do {
                                            String mname = rstmt.getString("mname");
                                            String hcardid = rstmt.getString("hcardid");
                                            System.out.println("For " + mname + " " + hcardid);
                                        } while (rstmt.next());

                                    } else {
                                        System.out.println("There are no appointments on this date");
                                        break;
                                    }
                                    break;
                                }
                                appt:while (true) {
                                    printApptMenu();
                                    Integer choice = sc.nextInt();
                                    sc.nextLine();
                                    switch (choice) {
                                        case 1:
                                            //date time text
                                            System.out.println("reviewing notes");
                                            reviewNotes(statement, currpid);
                                            break;
                                        case 2:
                                            System.out.println("reviewing tests");
                                            //date [ttype] results
                                            reviewTests(statement, currpid);
                                            break;
                                        case 3:
                                            System.out.println("adding a note");
                                            System.out.println("Please type your observation:");
                                            String obs = sc.nextLine();
                                            addNotes(statement, apptopt, obs);
                                            break;
                                        case 4:
                                            System.out.println("prescribing a test");
                                            System.out.println("Please enter the type of test");
                                            System.out.println(currpid);
                                            String ttype = sc.nextLine();
                                            prescribeTests(statement, currpid,practitionerid, ttype);
                                            break;
                                        case 5:
                                            System.out.println("back to the appointments");
                                            for (String a: appts){
                                                System.out.println(a);
                                            }
                                            break appt;
                                        default:
                                            System.out.println("Please enter options 1/2/3/4/5.");
                                            break;
                                    }
                                }
                            }
                            }
                        }
                    //rsadate.close();
                    }
            }
            else{
                System.out.println("practitionerid does not exist. Please try again");
            }
            //rspid.close();
        }
        statement.close();
        con.close();
    }

    private static void printApptMenu(){
        System.out.println("1. Review notes");
        System.out.println("2. Review tests");
        System.out.println("3. Add a note");
        System.out.println("4. Prescribe a test");
        System.out.println("5. Back to the appointments\n");
        System.out.println("Enter your choice: ");
    }

    private static void reviewNotes(Statement statement,String pregnancyid){
        // aid appointmentid
        List<String> aids = new ArrayList<>();
        try {
            String appts = "select * from appointment where pregnancyid=" + pregnancyid;
            //System.out.println(appts);
            ResultSet rs1 = statement.executeQuery(appts);
            while (rs1.next()){
                String aid = rs1.getString("aid");
                System.out.println("aid: " + aid);
                aids.add(aid);
            }
            String aidtuple = "(" + String.join(",", aids) + ")";
            //System.out.println(aidtuple);
            String sql = "select * from notes where aid in " + aidtuple + " order by timestmp";
            ResultSet rs2 = statement.executeQuery(sql);
            if(rs2.next()) {
                do {
                    // text less than 50 chars
                    String text = rs2.getString("text");
                    if(text.length()>50){
                        text = text.substring(0,50);
                    }
                    System.out.println(rs2.getString("timestmp") + "\t" + text);
                } while (rs2.next());
            }
            rs1.close();
            rs2.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void reviewTests(Statement statement, String pregnancyid){
        List<String> tids = new ArrayList<>();
        try{
            String tests = "select * from testsamples where pregnancyid=" + pregnancyid + " order by prescdate";
            ResultSet rs1 = statement.executeQuery(tests);
            if(rs1.next()){
                do{
                    String results = rs1.getString("results");;
                    if (results==null){
                        results = "PENDING";
                    }
                    else if(results.length()>50){
                        results = results.substring(0,50);
                    }
                    else{
                        results = rs1.getString("results");
                    }
                    String ttype = "[" + rs1.getString("testtype") + "]";
                    System.out.println(rs1.getString("prescdate") + "\t" + ttype + "\t" + results);
                }while (rs1.next());
            }
            //rs1.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void addNotes(Statement statement, String aid, String obs){
        Integer noteid;
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        try {
            String sql1 = "select max(noteid) from notes where aid=" + aid;
            ResultSet rs1 = statement.executeQuery(sql1);
            if(rs1.next()) {
                noteid = rs1.getInt(1) + 1;
            }
            else {
                noteid = 1;
            }
            if(obs.length()>50){
                obs = obs.substring(0,50);
            }
            //Timestamp ts = rs1.getTimestamp(1);
            String sql2 = String.format("insert into notes(aid,noteid,timestmp,text) values(\'%s\',\'%s\',\'%s\',\'%s\')",aid,String.valueOf(noteid),timestamp,obs);
//            String sql2 = "insert into notes(aid,noteid,timestmp,text) values(\'" + aid + "\'," + String.valueOf(noteid) + "," + rs1.getString("timestmp")
//                    + "," + obs + ")";
            System.out.println(sql2);
            statement.executeUpdate(sql2);
            //rs1.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void prescribeTests(Statement statement, String pregnancyidid, String practitionerid, String testtype){
        //insert test type
        LocalDate date = LocalDate.now();
        Integer testid;
        try {
            String sql1 = "select max(testid) from testsamples";
            ResultSet rs1 = statement.executeQuery(sql1);
            if(rs1.next()) {
                testid = rs1.getInt(1) + 1;
            }
            else {
                testid = 1;
            }
            // technician 06 prescribes all tests
            String tid = "06";
            String sql2 = String.format("insert into TestSamples(testid,practitionerid,pregnancyid,tid,testtype,labdate,prescdate) values(\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\')", testid,practitionerid,pregnancyidid,tid,testtype,date,date);
            System.out.println(sql2);
            statement.executeUpdate(sql2);

            //System.out.println(sql2);
            //rs1.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
