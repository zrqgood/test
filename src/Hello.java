public class Hello {
	public static void main(String[] args) {
		int[] a = { 6, 4,11, 66, 1, 2, 67, 99 };
		//int[] b = new int[7];
		int temp = 0;
		for (int i = 0; i < a.length; i++) {
			for (int j = i + 1; j < a.length; j++) {
				if (a[i] < a[j]) {
					temp = a[i];
					a[i] = a[j];
					a[j] = temp;
				}
			}
			System.out.println(a[i]);
			System.out.println(a[i]);
		}
	}
}