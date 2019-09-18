    disp(['Setting up tests in ', mfilename()]);
g1 = cycle([1:276], [1, 245, 185], [2, 42, 87], [3, 112, 266], [4, 15, 22], [5, 131, 30], [6, 7, 188], [8, 75, 111],
[9, 132, 82], [12, 187, 124], [13, 186, 136], [14, 265, 213], [16, 159, 99], [17, 256, 130],
[18, 43, 167], [19, 101, 31], [20, 123, 269], [21, 134, 74], [23, 32, 60], [24, 209, 67],
[25, 238, 162], [26, 35, 154], [27, 45, 221], [28, 235, 270], [29, 126, 129], [33, 66, 210],
[34, 80, 114], [36, 251, 229], [37, 117, 161], [38, 206, 63], [39, 71, 196], [40, 118, 180],
[41, 93, 170], [44, 271, 164], [46, 261, 108], [47, 182, 49], [48, 155, 248], [50, 230, 153],
[51, 172, 103], [52, 236, 165], [53, 109, 64], [54, 191, 100], [55, 76, 203], [56, 156, 260],
[57, 73, 149], [58, 116, 145], [59, 147, 273], [61, 127, 189], [62, 231, 197], [65, 122, 169],
[69, 86, 95], [70, 255, 192], [72, 139, 78], [77, 252, 151], [79, 262, 184], [81, 214, 242],
[83, 181, 223], [84, 174, 200], [88, 250, 276], [89, 257, 244], [90, 243, 91], [92, 158, 107],
[94, 148, 215], [96, 105, 125], [97, 249, 202], [98, 263, 193], [102, 115, 175], [106, 219, 150],
[110, 204, 152], [113, 225, 216], [119, 237, 166], [120, 241, 234], [121, 224, 195], [128, 190, 268],
[133, 143, 228], [135, 168, 201], [137, 227, 247], [138, 217, 240], [140, 258, 232], [141, 220, 205],
[142, 178, 207], [144, 146, 254], [157, 274, 179], [160, 253, 176], [163, 272, 226], [171, 233, 194],
[173, 246, 212], [177, 198, 211], [183, 267, 222], [199, 208, 259], [218, 264, 239]);

g2 = cycle([1:276], [1, 204, 123, 82], [2, 203, 14, 53], [3, 33, 40, 118], [4, 236, 168, 138], [6, 172, 188, 157],
[7, 77, 25, 242], [8, 76, 85, 264], [9, 47, 22, 190], [10, 146, 50, 26], [11, 133, 220, 254],
[12, 224, 179, 58], [13, 229, 169, 23], [15, 84, 148, 78], [17, 223], [18, 228], [19, 130, 104, 167],
[20, 131, 90, 60], [21, 252, 185, 205], [24, 263, 214, 81], [27, 32, 209, 61], [28, 196, 67, 137],
[29, 199, 87, 48], [30, 65, 218, 112], [31, 246, 98, 213], [34, 99, 165, 265], [35, 241],
[36, 198, 161, 89], [37, 269], [38, 251, 42, 271], [39, 75, 260, 193], [41, 176, 192, 57],
[43, 183, 91, 171], [44, 116, 173, 102], [45, 197, 119, 73], [46, 238, 124, 162], [49, 178, 83, 274],
[51, 174, 244, 100], [52, 129], [54, 153, 217, 151], [55, 272, 136, 237], [56, 257, 154, 121],
[62, 175, 219, 215], [63, 106, 66, 259], [64, 159, 210, 194], [68, 258, 221, 234], [69, 261, 134, 155],
[70, 164, 211, 266], [71, 262], [72, 189, 114, 222], [74, 177, 256, 135], [79, 226, 267, 202],
[80, 96, 120, 239], [86, 132, 216, 160], [88, 117, 231, 109], [92, 201, 111, 276],
[93, 101, 115, 166], [94, 253], [97, 142, 270, 110], [105, 243, 212, 225], [107, 141, 230, 249],
[113, 139], [122, 170, 126, 207], [125, 163, 184, 158], [127, 145, 206, 149], [140, 273],
[143, 248, 247, 195], [144, 180], [147, 250, 182, 187], [152, 232, 208, 191], [186, 235, 233, 275]);

Co3 = replab.Permutations(276).subgroup({g1, g2}); %Group Co3