// Draw textbox
draw_rectangle(x-2,y-2,x+boxWidth+2,y+boxHeight+2,false);
draw_sprite(spr_textbox, 0, x, y);

// Set font
draw_set_font(fnt_text);

// Increment char count every frame
if(charCount < string_length(text[page])){
charCount += 1; // Speed that text is printed
}

// Copy part of text for typewriter effect
textPart = string_copy(text[page], 1, charCount);

// Draw name
draw_set_colour(c_yellow); // Name color
draw_set_halign(fa_center); // Name alignment
draw_text(x+(boxWidth/2),y+yBuffer, name); // Offset of name
draw_set_halign(fa_left); // Back to default alignment

// Draw part of text for typewriter effect
draw_set_colour(c_white);
draw_text_ext(x+xBuffer, y+stringHeight+yBuffer, textPart, stringHeight, boxWidth - (2*xBuffer));