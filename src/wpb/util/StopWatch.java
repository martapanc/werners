package wpb.util;

public class StopWatch {

	long startTime = 0;
	long stopTime = 0;

	public void start() {
		startTime = System.currentTimeMillis();
	}

	public void stop() {
		stopTime = System.currentTimeMillis();
	}

	public long getElapsedTime() {
		return stopTime - startTime;

	}

}
