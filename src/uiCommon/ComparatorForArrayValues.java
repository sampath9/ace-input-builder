package uiCommon;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class ComparatorForArrayValues implements Comparator {
	private int columnToSortOn;

	// contructor to set the column to sort on.
	ComparatorForArrayValues(int columnToSortOn) {
		this.columnToSortOn = columnToSortOn;
	}

	// Implement the abstract method which tells
	// how to order the two elements in the array.
	public int compare(Object o1, Object o2) {
		// cast the object args back to string arrays
		String[] row1 = (String[]) o1;
		String[] row2 = (String[]) o2;

		// compare the desired column values
		return row1[columnToSortOn].compareTo(row2[columnToSortOn]);
	}

	public static <T extends Comparable<T>> void sort(final T[][] toSort,
			final int[] onColumn) {
		List<T[]> list = Arrays.asList(toSort);
		Collections.sort(list, new Comparator<T[]>() {
			public int compare(T[] a, T[] b) {
				for (int i = 0; i < onColumn.length - 1; i++) {
					if (a[onColumn[i]].compareTo(b[onColumn[i]]) != 0) {

						return a[onColumn[i]].compareTo(b[onColumn[i]]);
					}
				}
				return a[onColumn.length].compareTo(b[onColumn.length]);
			}
		});
	}
}
