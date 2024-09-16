<?php

namespace Botble\JobBoard\Http\Controllers\Fronts;

use Botble\Base\Http\Controllers\BaseController;
use Botble\JobBoard\Http\Requests\CheckoutRequest;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Services\Gateways\BankTransferPaymentService;
use Botble\Payment\Services\Gateways\CodPaymentService;
use Illuminate\Support\Arr;

class CheckoutController extends BaseController
{
    public function postCheckout(CheckoutRequest $request)
    {
        $returnUrl = $request->input('return_url');

        $currency = $request->input('currency', config('plugins.payment.payment.currency'));
        $currency = strtoupper($currency);

        $data = [
            'error' => false,
            'message' => false,
            'amount' => $request->input('amount'),
            'currency' => $currency,
            'type' => $request->input('payment_method'),
            'charge_id' => null,
        ];

        session()->put('selected_payment_method', $data['type']);

        $paymentData = apply_filters(PAYMENT_FILTER_PAYMENT_DATA, [], $request);

        switch ($request->input('payment_method')) {
            case PaymentMethodEnum::COD:
                $codPaymentService = app(CodPaymentService::class);
                $data['charge_id'] = $codPaymentService->execute($paymentData);
                $data['message'] = trans('plugins/payment::payment.payment_pending');
                $data['checkoutUrl'] = $request->input('callback_url') . '?charge_id=' . $data['charge_id'];

                break;

            case PaymentMethodEnum::BANK_TRANSFER:
                $bankTransferPaymentService = app(BankTransferPaymentService::class);
                $data['charge_id'] = $bankTransferPaymentService->execute($paymentData);
                $data['message'] = trans('plugins/payment::payment.payment_pending');
                $data['checkoutUrl'] = $request->input('callback_url') . '?charge_id=' . $data['charge_id'];

                break;

            default:
                $data = apply_filters(PAYMENT_FILTER_AFTER_POST_CHECKOUT, $data, $request);

                break;
        }

        if ($checkoutUrl = Arr::get($data, 'checkoutUrl')) {
            return $this
                ->httpResponse()
                ->setError($data['error'])
                ->setNextUrl($checkoutUrl)
                ->withInput()
                ->setMessage($data['message']);
        }

        if ($data['error'] || ! $data['charge_id']) {
            return $this
                ->httpResponse()
                ->setError()
                ->setNextUrl($returnUrl)
                ->withInput()
                ->setMessage($data['message'] ?: __('Checkout error!'));
        }

        $callbackUrl = $request->input('callback_url') . '?' . http_build_query($data);

        return redirect()->to($callbackUrl)->with('success_msg', trans('plugins/payment::payment.checkout_success'));
    }
}
