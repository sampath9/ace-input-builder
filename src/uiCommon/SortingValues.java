/**
 * 
 */
package uiCommon;

import java.io.BufferedReader;

import java.io.FileReader;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Arrays;
import java.util.StringTokenizer;

import com.csvreader.CsvReader;

/**
 * @author sampath
 * 
 */
public class SortingValues {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static int row = 0;
	public static int col = 0;

	public static String MetadataValues[][] = new String[100][100];
	public static String WeatherValues[][] = new String[100][100];
	public static String SoilValues[][] = new String[100][100];
	public static String InitialConditions[][] = new String[100][100];
	public static String ManagementEvents[][] = new String[100][100];
	public static String ObservationValues[][] = new String[100][100];
	public static int MetadataValuesCounter = 0;
	public static int WeatherValuesCounter = 0;
	public static int SoilValuesCounter = 0;
	public static int InitConditionsValuesCounter = 0;
	public static int ManagementEventsCounter = 0;
	public static int ObservationsValuesCounter = 0;

	public static String[][] elements = new String[1000][1000];

	public static void main(String[] args) throws IOException {

		// objectives_of_study 19 OBJECTIVES 10 OBJECTIVES 5 Objectives of the
		// study text memo EXPERIMENT EXPERIMENT_METADATA EXPERIMENT_INTRO 1011
		// . . 1 0

		// main_experiment_factor 22 MAIN_FACTOR 11 MAIN_FACTOR 6 Main factor,
		// factors or interactions of interest in an experiment text text 255
		// EXPERIMENT EXPERIMENT_METADATA EXPERIMENT_INTRO 1011 1 0
		// CsvReader reader = new CsvReader(new FileReader("yourfile.csv"));
		SortingValues sv = new SortingValues();
		BeanClass bc = new BeanClass();
		bc.setTest("Hello");
		// adding the code for reading the elements form csv file
		elements = sv.readValuesFromCSV("Test.csv");
		int onColumn[] = { 24, 15, 5, 4 };
		sv.sort(elements, onColumn);
		String code_display = null;
		String description = null;
		String unit_or_type = null;
		String AGMIP_data_entry = null;
		boolean toPrint = true;
		String category = null;
		for (int i = 0; i < elements.length; i++) {
			String[] row = elements[i];
			for (int j = 0; j < row.length; ++j) {
				if (j == 2) {
					code_display = row[j];
				}
				if (j == 7) {
					description = row[j];
				}
				if (j == 8) {
					unit_or_type = row[j];
				}
				if (j == 15 && row[j] != null) {
					category = sv.CategorizeCropData(row[j]);
				}
				if (j == 23) {
					AGMIP_data_entry = row[j];
					if (AGMIP_data_entry == null) {
						toPrint = false;
					} else if (AGMIP_data_entry != null
							&& AGMIP_data_entry.contains("-")) {
						toPrint = false;
					} else
						toPrint = true;
				}
			}
			if (toPrint) {
				System.out.println("category" + category);
				if (code_display != null && description != null
						&& unit_or_type != null && category != null) {
					sv.StoreCategorizedValues(code_display, description,
							unit_or_type, category);
				}
				code_display = null;
				description = null;
				unit_or_type = null;
				category = null;
			}
		}
		BeanClass bc1 = new BeanClass();
		SortingValuesUsingjsp svuj = new SortingValuesUsingjsp();
		System.out.println(bc1.getMetadataValues());
		System.out.println(bc1.getMetadataValuesCounter());
		bc1.setSoilValues(SoilValues);
		for (int i = 0; i <= MetadataValuesCounter; i++) {
			for (int j = 0; j <= 2; j++) {
				if (MetadataValues[i][j] != null)
					System.out
							.println("metadata values" + MetadataValues[i][j]);
			}
		}
		for (int i = 0; i <= SoilValuesCounter; i++) {
			for (int j = 0; j <= 2; j++) {
				if (SoilValues[i][j] != null)
					System.out.println("soil values" + SoilValues[i][j]);
			}
		}
	}

	/*
	 * 
	 * Method for sorting on the columns according to the priority
	 */
	public <T extends Comparable<T>> void sort(final T[][] toSort,
			final int[] onColumn) {
		List<T[]> list = Arrays.asList(toSort);
		Collections.sort(list, new Comparator<T[]>() {
			public int compare(T[] a, T[] b) {
				for (int i = 0; i < onColumn.length - 1; i++) {

					/*
					 * if (a[onColumn[i]] == null){ a[onColumn[i]]=(T) ""; }
					 * if(b[onColumn[i]] == null) { b[onColumn[i]]=(T) ""; }
					 */
					if (a[onColumn[i]] != null && b[onColumn[i]] != null) {
						if (a[onColumn[i]].compareTo(b[onColumn[i]]) != 0) {
							if (i == 0) {
								System.out.println(b[onColumn[i]] + "b"
										+ a[onColumn[i]] + "a");
								return b[onColumn[i]].compareTo(a[onColumn[i]]);
							} else {
								return a[onColumn[i]].compareTo(b[onColumn[i]]);
							}
						}
					}
				}
				if (a[onColumn.length] != null && b[onColumn.length] != null) {
					return a[onColumn.length].compareTo(b[onColumn.length]);
				} else {
					return 0;
				}
			}
		});
	}

	public String[][] readValuesFromCSV(String filename) throws IOException {
		String[][] arrayElements = new String[1000][1000];
		String storageString = null;
		BufferedReader bufRdr = new BufferedReader(new FileReader(
				"C://Users/sampath/Downloads/Test.csv"));
		String line = null;
		// read each line of text file
		while ((line = bufRdr.readLine()) != null) {
			StringTokenizer st = new StringTokenizer(line, ",");
			while (st.hasMoreTokens()) {
				storageString = st.nextToken().replace("\"", "");
				// get next token and store it in the array
				elements[row][col] = storageString;
				col++;
				if (col == 27) {
					col = 0;
				}
			}
			row++;
		}

		// close the file
		bufRdr.close();
		for (int i = 0; i < row; i++) {
			String[] rowfinal = elements[i];
			for (int j = 0; j < rowfinal.length; j++) {
				if (rowfinal[j] != null) {
					// System.out.print(rowfinal[j] + " | ");
				}
			}

			System.out.print("\n");
		}
		return elements;
	}

	public String CategorizeCropData(String setGroupOrder) {
		int SetGroupNumber = Integer.parseInt(setGroupOrder);
		String category = null;
		if ((SetGroupNumber >= 1011 && SetGroupNumber <= 1081)
				|| SetGroupNumber == 2011 || SetGroupNumber == 2031
				|| SetGroupNumber == 2121 || SetGroupNumber == 2071
				|| SetGroupNumber == 2081) {
			// Global bucket
			category = "Metadata";
		} else if ((SetGroupNumber >= 5011 && SetGroupNumber <= 5013)
				|| SetGroupNumber == 5041) {
			// Weather Global bucket
			category = "Weather";
		} else if (SetGroupNumber == 5052) {
			// Weather Daily data
			category = "Weather";
		} else if ((SetGroupNumber >= 4001 && SetGroupNumber <= 4031)
				|| (SetGroupNumber >= 4041 && SetGroupNumber <= 4042)
				|| SetGroupNumber == 4051) {
			// Soil Global
			category = "Soil";
		} else if (SetGroupNumber == 4052) {
			// Soil Layer data
			category = "Soil";
		} else if (SetGroupNumber == 2051) {
			// Initial Conditions
			category = "Initial Conditions";
		} else if (SetGroupNumber == 2052) {
			// Initial Conditions soil layer data
			category = "Initial Conditions";
		} else if (SetGroupNumber == 2021 || SetGroupNumber == 2061) {
			// Events - planting
			category = "Management events";
		} else if (SetGroupNumber == 2072) {
			// Events - irrigation
			category = "Management events";
		} else if (SetGroupNumber == 2073) {
			// Events - auto-irrigation
			category = "Management events";
		} else if (SetGroupNumber == 2082) {
			// Events - fertilizer
			category = "Management events";
		} else if (SetGroupNumber == 2122) {
			// Events - tillage
			category = "Management events";
		} else if (SetGroupNumber == 2141 || SetGroupNumber == 2142) {
			// Events - harvest
			category = "Management events";
		} else if (SetGroupNumber >= 2502 && SetGroupNumber <= 2510) {
			// Observed summary data
			category = "Observed";
		} else if (SetGroupNumber >= 2511 && SetGroupNumber <= 2599) {
			// Observed time series data
			category = "Observed";
		} else {
			// Ignored!
			category = "Ignored";
		}
		return category;
	}

	public String StoreCategorizedValues(String code_display,
			String description, String unit_or_type, String category) {
		if (category.equalsIgnoreCase("Metadata")) {
			MetadataValues[MetadataValuesCounter][0] = code_display;
			MetadataValues[MetadataValuesCounter][1] = description;
			MetadataValues[MetadataValuesCounter][2] = unit_or_type;
			MetadataValuesCounter = MetadataValuesCounter + 1;
		} else if (category.equalsIgnoreCase("Weather")) {
			WeatherValues[WeatherValuesCounter][0] = code_display;
			WeatherValues[WeatherValuesCounter][1] = description;
			WeatherValues[WeatherValuesCounter][2] = unit_or_type;
			WeatherValuesCounter = WeatherValuesCounter + 1;
		} else if (category.equalsIgnoreCase("Soil")) {
			System.out.println("code" + code_display + description
					+ unit_or_type);
			SoilValues[SoilValuesCounter][0] = code_display;
			SoilValues[SoilValuesCounter][1] = description;
			SoilValues[SoilValuesCounter][2] = unit_or_type;
			SoilValuesCounter = SoilValuesCounter + 1;
		} else if (category.equalsIgnoreCase("Initial Conditions")) {
			InitialConditions[InitConditionsValuesCounter][0] = code_display;
			InitialConditions[InitConditionsValuesCounter][1] = description;
			InitialConditions[InitConditionsValuesCounter][2] = unit_or_type;
			InitConditionsValuesCounter = InitConditionsValuesCounter + 1;
		} else if (category.equalsIgnoreCase("Management events")) {
			ManagementEvents[ManagementEventsCounter][0] = code_display;
			ManagementEvents[ManagementEventsCounter][1] = description;
			ManagementEvents[ManagementEventsCounter][2] = unit_or_type;
			ManagementEventsCounter = ManagementEventsCounter + 1;
		} else if (category.equalsIgnoreCase("Observed")) {
			ObservationValues[ObservationsValuesCounter][0] = code_display;
			ObservationValues[ObservationsValuesCounter][1] = description;
			ObservationValues[ObservationsValuesCounter][2] = unit_or_type;
			ObservationsValuesCounter = ObservationsValuesCounter + 1;
		}

		return "success";

	}
}
