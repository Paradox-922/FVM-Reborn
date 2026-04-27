import sys
import os

# ===== 批量替换规则 =====
REPLACE_RULES = {
    '"type": "normal_mouse"': '"type": "infected_normal_mouse"',
    '"type": "football_fan_mouse"': '"type": "infected_football_fan_mouse"',
    '"type": "iron_pan_mouse"': '"type": "infected_iron_pan_mouse"',
    '"type": "giant_mouse"': '"type": "infected_giant_mouse"',
    '"type": "kangaroo"': '"type": "infected_kangaroo"',
    '"type": "landlady_mouse"': '"type": "infected_landlady_mouse"',
    '"type": "roller_skating_mouse"': '"type": "infected_roller_skating_mouse"',
    '"type": "skateboard_mouse"': '"type": "infected_skateboard_mouse"',
    '"type": "panda_mouse"': '"type": "infected_panda_mouse"',
    '"type": "paper_boat_mouse"': '"type": "infected_paper_boat_mouse"',
    '"type": "duck_mouse"': '"type": "infected_duck_mouse"',
    '"type": "tropical_fish_mouse"': '"type": "infected_tropical_fish_mouse"',
    '"type": "diver_mouse"': '"type": "infected_diver_mouse"',
    '"type": "frog_prince_mouse"': '"type": "infected_frog_prince_mouse"',
    '"type": "submarine_mouse"': '"type": "infected_submarine_mouse"',
    '"boss": "mario_mouse"': '"boss": "infected_mario_mouse"',
    '"boss": "arno"': '"boss": "infected_arno"',
}


def replace_in_file(filepath):
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        modified = False

        for old_text, new_text in REPLACE_RULES.items():
            if old_text in content:
                content = content.replace(old_text, new_text)
                modified = True

        if modified:
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(content)

            print(f"[修改] {filepath}")
        else:
            print(f"[跳过] {filepath}")

    except Exception as e:
        print(f"[失败] {filepath}")
        print(e)


def scan_folder(folder):
    for root, dirs, files in os.walk(folder):
        for file in files:
            if file.endswith(".json"):
                filepath = os.path.join(root, file)
                replace_in_file(filepath)


def main():
    if len(sys.argv) <= 1:
        print("拖文件或文件夹到脚本上")
        input()
        return

    for path in sys.argv[1:]:
        if os.path.isfile(path):
            replace_in_file(path)

        elif os.path.isdir(path):
            scan_folder(path)

    print("\n处理完成")
    input()


if __name__ == "__main__":
    main()