package pipeline_ui;

import static org.hamcrest.CoreMatchers.containsString;
import static org.junit.Assert.*;

import org.junit.Test;

public class Pipeline_uiTest {

	private Pipelineui pipelineui = new Pipelineui();

	@Test
	public void PipelineuiSaysHello() {
		assertThat(pipelineui.sayHello(), containsString("Hello"));
	}

}
