package models;

public class Player {
    private String email;
    private int numGuesses;

    public Player(){

    }
    public Player(String email, int numGuesses) {
        this.email = email;
        this.numGuesses = numGuesses;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNumGuesses() {
        return numGuesses;
    }
}
