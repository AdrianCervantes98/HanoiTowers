public class Hanoi { 

		public static void main(String args[]) { 
			//n defines the number of disks
			int n = 3;
			//call recursive Hanoi Towers algorithm with n, starting rod, end rod, and aux rod
			towerOfHanoi(n, 1, 3, 2);  
		} 	
		
	//Recursive function for Hanoi Towers	
	public static void towerOfHanoi(int n, int start, int end, int aux) {
		//If there's only one disk, move it from the start rod to the end rod
		if (n == 1) { 
			System.out.println("Move disk 1 from rod " +  start + " to rod " + end); 
			return; 
		} 
		//Call the function again inverting the aux rod and the end rod
		towerOfHanoi(n-1, start, aux, end); 
		//Print the n disk that moved from the start to the end
		System.out.println("Move disk " + n + " from rod " +  start + " to rod " + end); 
		//Call the function again inverting the aux rod and the start rod
		towerOfHanoi(n-1, aux, end, start);
	} 

}
