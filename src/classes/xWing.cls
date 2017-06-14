public class xWing {

	// Attributes usually come first!
	String  name;
	Integer protonTorpedoes;
	Integer deathStarsDestroyed;
	Decimal powerRemaining;

	User    pilot;
	Account manufacturer;

	//constuctors
	public xWing(String nickname, User myUser) {
		name				= nickname;
		protonTorpedoes		= 2;
		deathStarsDestroyed	= 0;
		powerRemaining		= 1.00;
		pilot				= myUser;
	}

	//method has one input and doesn't return anything
	public void shootLasers(Integer numberOfShots) {
		for (Integer i = 0; i < numberOfShots; i++) {
			System.debug('PEW PEW');
		}
	}
	//reference class attributes
	public void fireProtonTorpedo() {
		if (protonTorpedoes > 0) {
			System.debug('Shoop... BOOM!!!');
			protonTorpedoes--; //decrements by 1
			deathStarsDestroyed++; //increments by 1
		}
	}
	//returns a value!
	public Boolean initiateHyperdrive() {
		Boolean isSuccess = false;
		if (powerRemaining > 0.10) {
			System.debug('Zoom zoom');
			powerRemaining = powerRemaining - 0.10;
			isSuccess = true;
		}
		return isSuccess;
	}

}