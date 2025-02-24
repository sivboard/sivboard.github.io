void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);

    Vec2 size = Scene::Size();
    double x = size.x / 6.0;
    double y = size.y / 6.0;
    LineString ls = { Vec2(30, 30), Vec2(size.x - 30, 30), Vec2(size.x - 30, size.y - 30), Vec2(30, size.y - 30) };

    while(System::Update())
    {
        double d1 = 1.0 - (Periodic::Sine0_1(3) * 0.5);
        double d2 = Periodic::Sine0_1(3) - 0.5;
        double d3 = Periodic::Sine0_1(3) * 0.5;

        ls.drawClosed(10, Palette::Silver);

        Circle(Vec2(x * 1, y), 30 * d1).draw(Palette::Turquoise);
        Circle(Vec2(x * 2, y), 30 * d1).drawFrame(10, Palette::Turquoise);
        Circle(Vec2(x * 3, y), 30).drawPie(_deg(0), _deg(270) * d1, Palette::Turquoise);
        Circle(Vec2(x * 4, y), 30).drawArc(_deg(0), _deg(270) * d1, 10, 0, Palette::Turquoise);
        Circle(Vec2(x * 5, y), 30).drawArc(_deg(0), _deg(270) * d1, 0, 10, Palette::Turquoise);

        Rect(Arg::center(x * 1, y * 2), 60, 60).rotated(d2).draw(Palette::Lightcoral);
        Triangle(Vec2(x * 2, y * 2), 60).rotated(d2).draw(Palette::Sandybrown);
        Quad(Vec2(x * 3 - 40, y * 2 - 30), Vec2(x * 3, y * 2 - 30), Vec2(x * 3 + 40, y * 2 + 30), Vec2(x * 3, y * 2 + 30)).rotatedAt(Vec2(x * 3, y * 2), d2).draw(Palette::Khaki);
        Ellipse(Vec2(x * 4, y * 2), 40, 30).asPolygon().rotatedAt(Vec2(x * 4, y * 2), d2).draw(Palette::Pink);
        RoundRect(Arg::center(x * 5, y * 2), 80, 60, 5).asPolygon().rotatedAt(Vec2(x * 5, y * 2), d2).draw(Palette::Lightgreen);

        Shape2D::Cross(40 * d1, 10, Vec2(x * 1, y * 3)).draw(Palette::Skyblue);
        Shape2D::Plus(40 * d1, 10, Vec2(x * 2, y * 3)).draw(Palette::Skyblue);
        Shape2D::Pentagon(40 * d1, Vec2(x * 3, y * 3)).draw(Palette::Skyblue);
        Shape2D::Hexagon(40 * d1, Vec2(x * 4, y * 3)).draw(Palette::Skyblue);
        Shape2D::Ngon(10, 40 * d1, Vec2(x * 5, y * 3)).draw(Palette::Skyblue);

        Shape2D::Star(40, Vec2(x * 1, y * 4)).asPolygon().rotatedAt(Vec2(x * 1, y * 4), d2).draw(Palette::Skyblue);
        Shape2D::NStar(10, 40, 30, Vec2(x * 2, y * 4)).asPolygon().rotatedAt(Vec2(x * 2, y * 4), d2).draw(Palette::Skyblue);
        Shape2D::Rhombus(80, 60, Vec2(x * 3, y * 4)).asPolygon().rotatedAt(Vec2(x * 3, y * 4), d2).draw(Palette::Skyblue);
        Shape2D::RectBalloon(RectF(x * 4 - 40, y * 4 - 30, 80, 40), Vec2(x * 4, y * 4 + 30)).asPolygon().rotatedAt(Vec2(x * 4, y * 4), d2).draw(Palette::Skyblue);
        Shape2D::Stairs(Vec2(x * 5 + 40, y * 4 + 30), 80, 60, 4).asPolygon().rotatedAt(Vec2(x * 5, y * 4), d2).draw(Palette::Skyblue);

        Shape2D::Arrow(Vec2(-30, 30), Vec2(30, -30), 20, Vec2(40, 30)).asPolygon().scaled(d1).movedBy(Vec2(x * 1, y * 5)).draw(Palette::Skyblue);
        Line(Vec2(x * 2 - 30, y * 5 - 30), Vec2(x * 2 + 30, y * 5 + 30)).stretched(-40 * d3).drawArrow(20, Vec2(40, 30), Palette::Gray);
        Line(Vec2(x * 3 - 30, y * 5), Vec2(x * 3 + 30, y * 5)).stretched(-40 * d3).draw(10, Palette::Gray);
        Line(Vec2(x * 4 - 30, y * 5), Vec2(x * 4 + 30, y * 5)).stretched(-40 * d3).draw(LineStyle::RoundDot, 10, Palette::Gray);
        Bezier2(Vec2(x * 5 - 40, y * 5 - 20).lerp(Vec2(x * 5, y * 5), d3), Vec2(x * 5, y * 5 + 80).lerp(Vec2(x * 5, y * 5), d3), Vec2(x * 5 + 40, y * 5 - 20).lerp(Vec2(x * 5, y * 5), d3)).draw(10, Palette::Orchid);

        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), Palette::White);
    }
}