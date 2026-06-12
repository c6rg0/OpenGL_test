#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <stdio.h>

void processInput(GLFWwindow *window)
{
	if(glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
		glfwSetWindowShouldClose(window, true);
}

void framebuffer_size_callback(GLFWwindow* window, int width, int height)
{
	glViewport(0, 0, width, height);
}

int main()
{
	// Initialize GLFW
	if (!glfwInit()){
        printf("GLFW init failed!\n");
		return -1;
	}
	
	GLFWwindow* window;

	/* Create a windowed mode window and its OpenGl context */
	window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
	if (!window)
	{
        printf("Failed to create GLFW window!\n");
		glfwTerminate();
		return -1;
	}

	/* Make the window's context current */
	glfwMakeContextCurrent(window);

	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
	{
        printf("Failed to init GLAD!\n");
		return -1;
	}

	glViewport(0, 0, 640, 480);
	glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
	
	/*Loop until the user closes the window */
	while (!glfwWindowShouldClose(window))
	{	
		processInput(window);

		/* Render here */
		glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
		glClear(GL_COLOR_BUFFER_BIT);

		/* Swap front and back buffers */
		glfwSwapBuffers(window);

		/* Poll for and process events */
		glfwPollEvents();
	}

	glfwTerminate();
	return 0;
}	
