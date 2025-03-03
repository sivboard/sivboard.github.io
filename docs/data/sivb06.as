﻿void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);

    int n=0, i, k;
    int size = 10;
    int blank;
    Array<Vec2> block;
    Array<Color> color;
    Array<int32> type;
    Array<int32> ground(Scene::Width() / size, 0);
    Array<int32> bottom;
    Stopwatch sw(true);
    Grid<int32> data =
    {
        {0,-1, 1,-1, 2,-1, 1, 0}, // T
        {0,-1, 1,-1, 1, 0, 2, 0}, // Z
        {2,-1, 1,-1, 1, 0, 0, 0}, // S
        {0,-2, 0,-1, 0, 0, 1, 0}, // L
        {1,-2, 1,-1, 0, 0, 1, 0}, // J
        {0,-1, 1,-1, 1, 0, 0, 0}, // O
        {0,-3, 0,-2, 0,-1, 0, 0}  // I
    };
    while(System::Update())
    {
        if (sw.sF() > 0.01)
        {
            sw.restart();
            type << Random(6);
            int x = Random(Scene::Width() / size - 4);
            block << Vec2(x, -size);
            color << RandomColor();
            blank = Scene::Height() / size - 1;
            for(k = 3; k >= 0; k--)
            {
                blank = Min(Scene::Height() / size - ground[data[k * 2, type[n]] + x] - data[k * 2 + 1, type[n]], blank);
            }
            for(k = 3; k >= 0; k--)
            {
                ground[data[k * 2, type[n]] + x] = Scene::Height() / size - blank - data[k * 2 + 1, type[n]] + 1;
            }
            bottom << blank * size;
            n++;
        }
        for (i = 0; i < n; i++)
        {
            block[i].y += Scene::DeltaTime() * 1000;
            block[i].y = Min(block[i].y, double(bottom[i]));
            for (k = 3; k >= 0; k--)
            {
                Rect((block[i].x + data[k * 2, type[i]] + 1) * size, block[i].y + data[k * 2 + 1, type[i]] * size, size - 1, size - 1).draw(color[i]);
            }
        }
        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), Palette::White);
    }
}