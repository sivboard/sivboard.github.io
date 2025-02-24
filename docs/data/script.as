void Main()
{
    Font font(60);
    while (System::Update())
    {
        font("Hello, SivBoard!").drawAt(Scene::Center(), Palette::White);
    }
}