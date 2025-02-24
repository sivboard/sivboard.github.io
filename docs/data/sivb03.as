void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);
    
    double x = (Scene::Width() - 600) * 0.5;
    double y = Scene::Height() / 6.0;
    Stopwatch sw(true);

    while(System::Update())
    {
        double t = sw.sF();
        double d1 = Periodic::Triangle0_1(3, t);
        double d2 = Periodic::Sine0_1(3, t);
        double d3 = Periodic::Jump0_1(3, t);
        double d4 = Periodic::Sawtooth0_1(3, t);

        Circle(Vec2(x, y * 5 - d1 * y * 4), 20).draw(Palette::Turquoise);
        Circle(Vec2(x + 40, y * 5 - EaseInOutQuad(d1) * y * 4), 20).draw(Palette::Turquoise);
        Circle(Vec2(x + 80, y * 5 - EaseInOutExpo(d1) * y * 4), 20).draw(Palette::Turquoise);
        Circle(Vec2(x + 120, y * 5 - EaseInOutBounce(d1) * y * 4), 20).draw(Palette::Turquoise);

        Circle(Vec2(x + 160, y * 5 - d2 * y * 4), 20).draw(Palette::Lightcoral);
        Circle(Vec2(x + 200, y * 5 - EaseInOutQuad(d2) * y * 4), 20).draw(Palette::Lightcoral);
        Circle(Vec2(x + 240, y * 5 - EaseInOutExpo(d2) * y * 4), 20).draw(Palette::Lightcoral);
        Circle(Vec2(x + 280, y * 5 - EaseInOutBounce(d2) * y * 4), 20).draw(Palette::Lightcoral);

        Circle(Vec2(x + 320, y * 5 - d3 * y * 4), 20).draw(Palette::Skyblue);
        Circle(Vec2(x + 360, y * 5 - EaseInOutQuad(d3) * y * 4), 20).draw(Palette::Skyblue);
        Circle(Vec2(x + 400, y * 5 - EaseInOutExpo(d3) * y * 4), 20).draw(Palette::Skyblue);
        Circle(Vec2(x + 440, y * 5 - EaseInOutBounce(d3) * y * 4), 20).draw(Palette::Skyblue);

        Circle(Vec2(x + 480, y * 5 - d4 * y * 4), 20).draw(Palette::Khaki);
        Circle(Vec2(x + 520, y * 5 - EaseInOutQuad(d4) * y * 4), 20).draw(Palette::Khaki);
        Circle(Vec2(x + 560, y * 5 - EaseInOutExpo(d4) * y * 4), 20).draw(Palette::Khaki);
        Circle(Vec2(x + 600, y * 5 - EaseInOutBounce(d4) * y * 4), 20).draw(Palette::Khaki);

        Line(Vec2(x - 20, y - 20), Vec2(x + 620, y - 20)).draw(5, Palette::White);
        Line(Vec2(x - 20, y * 5 + 20), Vec2(x + 620, y * 5 + 20)).draw(5, Palette::White);

        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), Palette::White);

        if (MouseL.down())
        {
            if (sw.isPaused())
            {
                sw.resume();
            }
            else
            {
                sw.pause();
            }
        }
    }
}