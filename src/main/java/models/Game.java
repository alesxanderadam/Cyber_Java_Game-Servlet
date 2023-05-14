    package models;

    import java.util.ArrayList;
    import java.util.List;
    public class Game {
        private int answer;
        private String hint;
        private int numGuesses;
        private boolean success;
//        private List<Player> playerGuesses;
        public void Game(){
            reset();
//            playerGuesses = new ArrayList<>();
        }
        public void setGuess(String guess) {
            numGuesses++;

            int g;
            try {
                g = Integer.parseInt(guess);
            }
            catch (NumberFormatException e) {
                g = -1;
            }

            if (g == answer) {
                success = true;
            }
            else if (g == -1) {
                hint = "Số nhập sai định dạng! vui lòng thử lại ";
            }
            else if (g < answer) {
                hint = "Quá thấp rồi bạn ơi! suy nghĩ tí nữa đi";
            }
            else if (g > answer) {
                hint = "Quá cao! hạ xuống xí nào";
            }
            Player player = new Player();
//            playerGuesses.add(new Player(player.getEmail(), numGuesses));

        }
        public boolean getSuccess() {
            return success;
        }
        public String getHint() {
            return "" + hint;
        }
        public int getNumGuesses() {
            return numGuesses;
        }
        public int getAnswer(){
            return answer;
        }
//        public List<Player> getPlayerGuesses() {
//            return playerGuesses;
//        }
        public void reset() {
            answer = (int) (Math.random() * 1000 + 1);
            //answer = Math.abs(new Random().nextInt() % 100) + 1;
            success = false;
            numGuesses = 0;
//            playerGuesses.clear();
        }
    }
