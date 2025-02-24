void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);

    Vec2 size = Scene::Size();
    double x = size.x / 10.0;
    double y = size.y / 10.0;

    Array<Texture> a(7);
    a[0] = Texture(Icon(0xf06d),50);
    a[1] = Texture(Icon(0xf043),50);
    a[2] = Texture(Icon(0xf0e7),50);
    a[3] = Texture(Icon(0xf0fe),50);
    a[4] = Texture(Icon(0xf0d0),50);
    a[5] = Texture(Icon(0xf6fc),200);
    a[6] = Texture(Icon(0xf1bb),100);

    Texture c = Texture("sivb05.png");
    ScopedRenderStates2D state(SamplerState::ClampNearest);

    while (System::Update())
    {
        RectF(Point(0, 0), size.x, y * 5).draw(Palette::Powderblue);

        double t1 = Periodic::Sawtooth0_1(20);
        double t2 = int(Periodic::Sawtooth0_1(0.2) * 4);

        int i;
        for (i = -10; i < 10; i++)
        {
            a[5].drawAt(Vec2(i * 200 + t1 * 1000, y * 4), Palette::Darkgreen);
        }
        for (i = -20; i < 20; i++)
        {
            a[6].drawAt(Vec2(i * 100 + t1 * 2000, y * 4 + 50), Palette::Forestgreen);
        }

        c.uv(t2 / 4, 0, 1.0 / 4, 1.0).scaled(8).drawAt(Scene::Center());

        Rect(10, 10, size.x - 20, y * 2 - 20).draw(ColorF(0.0, 0.3));
        Rect(10, y * 7 + 10, size.x - 20, y * 3 - 20).draw(ColorF(1.0, 0.3));

        a[0].drawAt(Vec2(x, y));
        a[1].drawAt(Vec2(x * 4, y));
        a[2].drawAt(Vec2(x * 7, y));
        font("999").drawAt(Vec2(x + 100, y));
        font("999").drawAt(Vec2(x * 4 + 100, y));
        font("999").drawAt(Vec2(x * 7 + 100, y));

        a[3].drawAt(Vec2(x, y * 8));
        a[4].drawAt(Vec2(x, y * 9));
        Rect(x + 50, y * 8 - 20, 500, 40).draw(Palette::Gray);
        Rect(x + 50, y * 9 - 20, 500, 40).draw(Palette::Gray);
        font("999/999").drawAt(Vec2(x + 200, y * 8));
        font("999/999").drawAt(Vec2(x + 200, y * 9));
        
        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), ColorF(1.0, 0.3));
    }
}