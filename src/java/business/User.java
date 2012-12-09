package business;

public class User {

    private String firstName;
    private String alamat;
    private String telepon;
    private String username;
    private String pass;
    private String admin;
    private String mode;

    public User() {
        firstName = "";
        alamat = "";
        telepon = "";
        username = "";
        pass = "";
        admin = "";
        mode = "";
    }
    
    public User(String username, String pass, String mode){
        this.username = username;
        this.pass = pass;
        this.mode = mode;
    }

    public User(String first, String alamat, String telepon, String username, String pass, String admin) {
        firstName = first;
        this.alamat = alamat;
        this.telepon = telepon;
        this.username = username;
        this.pass = pass;
        this.admin = admin;
    }

    public void setFirstName(String f) {
        firstName = f;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setAlamat(String l) {
        alamat = l;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setTelepon(String e) {
        telepon = e;
    }

    public String getTelepon() {
        return telepon;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the admin
     */
    public String getAdmin() {
        return admin;
    }

    /**
     * @param admin the admin to set
     */
    public void setAdmin(String admin) {
        this.admin = admin;
    }

    /**
     * @return the mode
     */
    public String getMode() {
        return mode;
    }

    /**
     * @param mode the mode to set
     */
    public void setMode(String mode) {
        this.mode = mode;
    }
}
