package uiCommon;

public class BeanClass {
	public String WeatherValues[][] = new String[100][100];
	public String SoilValues[][] = new String[100][100];
	public String InitialConditions[][] = new String[100][100];
	public String ManagementEvents[][] = new String[100][100];
	public String ObservationValues[][] = new String[100][100];
	public String MetadataValues[][] = new String[100][100];
	public String Test;
	public int MetadataValuesCounter = 0;

	/**
	 * @return the metadataValuesCounter
	 */
	public int getMetadataValuesCounter() {
		return MetadataValuesCounter;
	}

	/**
	 * @param metadataValuesCounter
	 *            the metadataValuesCounter to set
	 */
	public void setMetadataValuesCounter(int metadataValuesCounter) {
		MetadataValuesCounter = metadataValuesCounter;
	}

	/**
	 * @return the weatherValues
	 */
	public String[][] getWeatherValues() {
		return WeatherValues;
	}

	/**
	 * @param weatherValues
	 *            the weatherValues to set
	 */
	public void setWeatherValues(String[][] weatherValues) {
		WeatherValues = weatherValues;
	}

	/**
	 * @return the soilValues
	 */
	public String[][] getSoilValues() {
		return SoilValues;
	}

	/**
	 * @param soilValues
	 *            the soilValues to set
	 */
	public void setSoilValues(String[][] soilValues) {
		SoilValues = soilValues;
	}

	/**
	 * @return the initialConditions
	 */
	public String[][] getInitialConditions() {
		return InitialConditions;
	}

	/**
	 * @param initialConditions
	 *            the initialConditions to set
	 */
	public void setInitialConditions(String[][] initialConditions) {
		InitialConditions = initialConditions;
	}

	/**
	 * @return the managementEvents
	 */
	public String[][] getManagementEvents() {
		return ManagementEvents;
	}

	/**
	 * @param managementEvents
	 *            the managementEvents to set
	 */
	public void setManagementEvents(String[][] managementEvents) {
		ManagementEvents = managementEvents;
	}

	/**
	 * @return the observationValues
	 */
	public String[][] getObservationValues() {
		return ObservationValues;
	}

	/**
	 * @param observationValues
	 *            the observationValues to set
	 */
	public void setObservationValues(String[][] observationValues) {
		ObservationValues = observationValues;
	}

	/**
	 * @return the metadataValues
	 */
	public String[][] getMetadataValues() {
		return MetadataValues;
	}

	/**
	 * @param metadataValues
	 *            the metadataValues to set
	 */
	public void setMetadataValues(String[][] metadataValues) {
		MetadataValues = metadataValues;
	}

	public void setTest(String input) {
		Test = input;
	}

	public String getTest() {
		return Test;
	}
}
