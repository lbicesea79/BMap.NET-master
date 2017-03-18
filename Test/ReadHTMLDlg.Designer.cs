namespace Test
{
    partial class ReadHTMLDlg
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.rTxBx = new System.Windows.Forms.RichTextBox();
            this.btnRead = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // rTxBx
            // 
            this.rTxBx.Location = new System.Drawing.Point(12, 12);
            this.rTxBx.Name = "rTxBx";
            this.rTxBx.Size = new System.Drawing.Size(1071, 514);
            this.rTxBx.TabIndex = 0;
            this.rTxBx.Text = "";
            // 
            // btnRead
            // 
            this.btnRead.Location = new System.Drawing.Point(1008, 532);
            this.btnRead.Name = "btnRead";
            this.btnRead.Size = new System.Drawing.Size(75, 23);
            this.btnRead.TabIndex = 1;
            this.btnRead.Text = "Read";
            this.btnRead.UseVisualStyleBackColor = true;
            this.btnRead.Click += new System.EventHandler(this.btnRead_Click);
            // 
            // ReadHTMLDlg
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1095, 567);
            this.Controls.Add(this.btnRead);
            this.Controls.Add(this.rTxBx);
            this.Name = "ReadHTMLDlg";
            this.Text = "ReadHTMLDlg";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox rTxBx;
        private System.Windows.Forms.Button btnRead;
    }
}