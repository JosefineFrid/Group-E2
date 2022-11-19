#include <TROOT.h>
#include <string>
#include <iostream>

void graph_tempMonth(const std::string& year)
{
	TGraph *gr = new TGraph();
	std::cout << "Got input: " << year << std::endl;
	fstream file;

	file.open(year, ios::in);
	
	double x, y;

	int n = 0;
	
	while(1)
	{
		file >> x >> y;
		n = gr->GetN();
		gr->SetPoint(n, x, y);
		if(file.eof()) break;

	}

	file.close();

	gr->SetTitle("Average temp/month");
	gr->GetXaxis()->SetTitle("Month");
	gr->GetXaxis()->CenterTitle();
	gr->GetYaxis()->SetTitle("Temperature");
	gr->GetYaxis()->CenterTitle();
	gr->Draw("A*");
	gr->Fit("gaus");
}

