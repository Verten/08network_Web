<%@ page contentType="image/jpeg" language="java"
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*,java.io.OutputStream"%>
<%@page import="java.io.*"%>
<%@page import="javax.imageio.stream.ImageOutputStream"%>

<%!ByteArrayInputStream inputStream;
	String code = "";

	// 产生四个0~9的随机数，放在一个字符串里
	public String createRandomString() {
		String str = "";
		for (int i = 0; i < 4; i++) {
			str += Integer
					.toString((new Double(Math.random() * 10)).intValue());
		}
		return str;
	}

	// 随机产生一个颜色
	public Color createsRandomColor() {
		int r = (new Double(Math.random() * 256)).intValue();
		int g = (new Double(Math.random() * 256)).intValue();
		int b = (new Double(Math.random() * 256)).intValue();
		return new Color(r, g, b);
	}%>

<%
	int width = 60;
	int height = 22;
	BufferedImage image = new BufferedImage(width, height,
			BufferedImage.TYPE_INT_RGB);
	Random random = new Random();
	// 获取图形上下文
	Graphics g = image.getGraphics();
	// 设定背景色
	g.setColor(Color.WHITE);
	g.fillRect(0, 0, width, height);
	// 画边框
	g.setColor(Color.BLACK);
	g.drawRect(0, 0, width - 1, height - 1);
	// 随机产生10条干扰线，使图象中的认证码不易被其它程序探测到。
	g.setColor(Color.BLACK);
	for (int i = 0; i < 10; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(12);
		int yl = random.nextInt(12);
		g.drawLine(x, y, x + xl, y + yl);
	}
	// 将认证码显示到图象中
	g.setFont(new Font("Atlantic Inline", Font.PLAIN, 18));
	// 使用随机颜色
	g.setColor(this.createsRandomColor());

	String[] codeStr = { "A", "B", "C", "D", "E", "F", "G", "H", "I",
			"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
			"V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6",
			"7", "8", "9" };

	int x = width / (4 + 1);
	int codeY = height - 4;

	StringBuilder randomCode = new StringBuilder();
	for (int i = 0; i < 4; i++) {
		// 得到随机产生的验证码数字。
		String strRand = codeStr[random.nextInt(codeStr.length)];
		// 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
		int red = random.nextInt(100);
		int green = random.nextInt(100);
		int blue = random.nextInt(100);
		// 用随机产生的颜色将验证码绘制到图像中。
		g.setColor(new Color(red, green, blue));
		g.drawString(strRand, 5 + i * (x), codeY);
		// 将产生的四个随机数组合在一起。
		randomCode.append(strRand);
	}

	// 图象生效
	g.dispose();
	session.setAttribute("mycode", randomCode.toString());
	OutputStream os = response.getOutputStream();
	// 输出图象到页面
	ImageIO.write(image, "JPEG", os);
	os.flush();
	os.close();
	os = null;
	response.flushBuffer();
	out.clear();
	out = pageContext.pushBody();
%>
