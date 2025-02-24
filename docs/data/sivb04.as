void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);

    int n = 100;
    int i;
    Array<Vec2> v(n);
    Array<Circle> b(n);

    for (i = 0; i < n; i++)
    {
        v[i] = RandomVec2(Scene::Width(), Scene::Height());
        b[i] = Circle(v[i], 5);
    }

    while (System::Update())
    {
        Circle o(Cursor::Pos(), 150);
        o.draw(ColorF(1.0, 0.1));

        for (i = 0; i < n; i++)
        {
            b[i].moveBy(v[i] * Scene::DeltaTime());

            if ((b[i].y < 0 && v[i].y < 0) || (Scene::Height() < b[i].y && v[i].y > 0))
            {
                v[i].y *= -1;
            }

            if ((b[i].x < 0 && v[i].x < 0) || (Scene::Width() < b[i].x && v[i].x > 0))
            {
                v[i].x *= -1;
            }

            if (b[i].intersects(o)) { b[i].draw(Palette::Yellow); }
            else { b[i].draw(Palette::Gray); }
        }

        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), Palette::White);
    }
}