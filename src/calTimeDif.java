
public class calTimeDif {

	String isTimeToday,timeForShow;
	public calTimeDif(String timeForShow,String isTimeToday)
	{
		timeForShow=this.timeForShow;
		isTimeToday=this.isTimeToday;
	}
	
	public String calci() {
		// TODO Auto-generated method stub

		
		
		
		String hr=timeForShow.substring(0,2);
		String min=timeForShow.substring(3,5);
		
		int hr1=Integer.parseInt(hr);
		int min1=Integer.parseInt(min);
		
		
		String hr2=isTimeToday.substring(0,2);
		String min2=isTimeToday.substring(3,5);
		
		int hr3=Integer.parseInt(hr2);
		int min3=Integer.parseInt(min2);
		
		int hour1=hr3-hr1;
		int minute1=min3-min1;
		
		if(minute1<0)
		{
			hour1=hour1-1;
			minute1=60+minute1;
		}
		
		
		String hour2=Integer.toString(hour1);
		String minute2=Integer.toString(minute1);
		
		String output=hour2+"+"+minute2;
		
	System.out.println(output);
	return output;
	}

}
